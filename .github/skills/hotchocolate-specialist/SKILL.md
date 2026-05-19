---
name: hotchocolate-specialist
description: "Deep domain knowledge for HotChocolate GraphQL in the Fusion-Backend — concrete code patterns, stitching/gateway conventions, and anti-patterns. Triggers on: HotChocolate schema design, ObjectType, InputType, TypeExtensions, DataLoaders, field middleware, QueryDelegationRewriter, schema stitching, Fusion gateway, GraphQL error handling, mutation conventions, secure IDs, API gateway. For migration/upgrade work (v13/v14/v15/v16 migration, breaking changes, Stitching→Fusion, @key @lookup @require directives, schema composition), the migration reference is loaded separately."
---

# HotChocolate Specialist

Concrete patterns, migration knowledge, and conventions for HotChocolate GraphQL in Fusion-Backend. Complements the `HotChocolate.Expert` agent (which owns workflow and architecture overview).

> **Self-update rule**: Always fetch the latest official docs before applying patterns. For migration/upgrade work, see [references/migration.md](references/migration.md).

## Keeping Knowledge Current

HotChocolate evolves rapidly. Always fetch the latest docs before applying patterns:

### For Schema Design / API Patterns

```
1. Use microsoft_docs_search for ".NET GraphQL HotChocolate <topic>"
2. Fetch https://chillicream.com/docs/hotchocolate/v16/defining-a-schema/object-types
3. For DataLoaders: Fetch https://chillicream.com/docs/hotchocolate/v16/fetching-data/dataloader
```

### For Stitching / Fusion Gateway

```
1. Fetch https://chillicream.com/docs/fusion/v16
2. Reference ADO branch: raem/explore-hot-chocolate-fusion-v16-preview (src/Gateway/doc)
```

### For Migration / Upgrade Work

See [references/migration.md](references/migration.md) for the full migration guide, breaking changes checklist, and latest doc URLs.

### General Rule

If online docs contradict patterns below, **the online docs win** — they represent the latest state. Update your implementation accordingly and inform the user of the deviation.

## Code Patterns

### ObjectType Definitions

Use class-based type definitions extending `ObjectType<T>`:

```csharp
public class ContractType : ObjectType<Contract>
{
    protected override void Configure(IObjectTypeDescriptor<Contract> descriptor)
    {
        descriptor.Field(x => x.Id).Type<NonNullType<IdType>>();
        descriptor.Field(x => x.Status).Type<NonNullType<EnumType<ContractStatus>>>();
    }
}
```

For simple types, prefer annotation-based approach:

```csharp
[ObjectType<Customer>]
public static partial class CustomerType
{
    public static string GetDisplayName([Parent] Customer customer)
        => $"{customer.FirstName} {customer.LastName}";
}
```

### TypeExtensions

Extend existing types without modifying their original definition:

```csharp
[ExtendObjectType(typeof(ParentEntity))]
public class ChildTypeExtensions
{
    public async Task<ChildResult> GetChildData(
        [Parent] ParentEntity parent,
        [Service] IChildService service,
        CancellationToken cancellationToken)
    {
        return await service.GetByParentIdAsync(parent.Id, cancellationToken);
    }
}
```

### DataLoaders

Use `BatchDataLoader<TKey, TValue>`. Naming: `{Entity}By{Key}DataLoader`.

```csharp
public sealed class ContractByIdDataLoader(
    IContractRepository repository,
    IBatchScheduler batchScheduler,
    DataLoaderOptions? options = null)
    : BatchDataLoader<string, Contract>(batchScheduler, options)
{
    protected override async Task<IReadOnlyDictionary<string, Contract>> LoadBatchAsync(
        IReadOnlyList<string> keys,
        CancellationToken cancellationToken)
    {
        IReadOnlyList<Contract> contracts =
            await repository.GetByIdsAsync(keys, cancellationToken);
        return contracts.ToDictionary(c => c.Id);
    }
}
```

### Mutation Conventions

Use HotChocolate's built-in mutation conventions with dedicated Input/Output types.

### Field Middleware

Chain middleware on fields using `FieldDelegate` and `IMiddlewareContext`. Pass data between middleware/resolvers via `ScopedContextData` with `IImmutableStack<object>`.

### Secure Object Identifiers

Use `SecureObjectIdentifier` with `ISecureContextResolver` for ID obfuscation.

## Stitching Gateway Patterns

The `src/Api/` layer stitches domain schemas into a unified gateway using `QueryDelegationRewriterBase`.

### Query Delegation Rewriter

```csharp
public class AddressQueryRewriter : QueryDelegationRewriterBase
{
    protected override SelectionSetNode RewriteSelectionSet(
        SelectionSetNode selectionSet,
        NameString schemaName)
    {
        // Map gateway fields to downstream service fields
        return base.RewriteSelectionSet(selectionSet, schemaName);
    }
}
```

### Type Conflict Resolution

When multiple domains expose the same type name (e.g., `User`):

```csharp
builder.RenameType("User", "ContractUser", "contract-service");
builder.RenameType("User", "ProfileUser", "profile-service");
```

### Hard Rule

The API gateway layer (`src/Api/`) contains **zero business logic** and **zero resolvers**. It only:
1. Stitches domain schemas together
2. Rewrites/delegates queries to downstream services
3. Configures gateway routing and schema composition

## Migration & Upgrade

For all migration and upgrade work (v15→v16, Stitching→Fusion), see [references/migration.md](references/migration.md).

This includes: v16 breaking changes checklist, Stitching→Fusion migration phases, and instructions for fetching the latest official docs before starting.

## Conventions

| Convention | Rule |
|---|---|
| Approach | Implementation-first (C# annotations/descriptors, not SDL-first) |
| Naming | `GraphQLNamingConventions` — enum values uppercased |
| Secure IDs | `SecureObjectIdentifier` with `ISecureContextResolver` |
| Introspection | Disabled by default, allowed for authenticated via `AllowAuthenticatedIntrospection()` |
| Mutations | Input/Output types; leverage mutation conventions |
| User type conflicts | `RenameType("User", "<Domain>User", clientName)` |
| Field middleware | `MapFieldMiddleware` extension for per-field middleware injection |
| Shared extensions | `src/Shared/src/HotChocolate.Extensions/` |

## Common Issues

| Issue | Cause | Fix |
|---|---|---|
| `Field not found` in stitched schema | Downstream field renamed, rewriter not updated | Update `QueryDelegationRewriterBase` field mapping |
| Null from delegated query | Auth policy mismatch or missing middleware | Check authorization in both gateway and domain |
| Type merge conflict | Two domains expose same type name | Add `RenameType` in `StitchingBuilderExtensions` |
| Schema build failure | Missing type registration | Verify `AddTypes()` includes all required types |
| `UUID uppercase error` | Downstream uses `UUID` instead of `Uuid` | Fix scalar name in domain service |
| v16-related issues | See migration reference | See [references/migration.md](references/migration.md) |

## Anti-Patterns

| Anti-Pattern | Fix |
|---|---|
| Business logic in `src/Api/` | Move to `Core` layer of domain service |
| Resolvers in API gateway layer | Move to domain `GraphQL` project |
| Hardcoded field names in rewriters | Keep rewriter fields synced with domain schema |
| Direct DB access from GraphQL layer | Access data through `Core` services |
| SDL-first schema definition | Use C# annotations or descriptors |
| `AddGraphQL()` without `AddApplicationService<T>()` (v16) | Always cross-register required app services — see [references/migration.md](references/migration.md) |

## HotChocolate Testing

### Schema Build Test

```csharp
[Fact]
public async Task Schema_ShouldBuildSuccessfully()
{
    IRequestExecutor executor = await new ServiceCollection()
        .AddGraphQLServer()
        .AddTypes()
        .BuildRequestExecutorAsync();

    ISchema schema = executor.Schema;
    schema.Should().NotBeNull();
    schema.ToString().MatchSnapshot();
}
```

> **Tip**: Search for `Schema_ShouldBuildSuccessfully` or `BuildRequestExecutorAsync` in the domain you are working on for a domain-specific schema build test.

### Resolver Integration Test

```csharp
[Fact]
public async Task GetContract_ShouldReturnData()
{
    IRequestExecutor executor = await BuildTestExecutor();

    IExecutionResult result = await executor.ExecuteAsync(
        QueryRequestBuilder.New()
            .SetQuery("{ contract(id: \"abc\") { id name } }")
            .Create());

    result.ToJson().MatchSnapshot();
}
```

### Middleware Testing

Use `DummyMiddlewareContext` / `DummyContext`:

```csharp
DummyMiddlewareContext context = new();
context.SetResult(testData);
context.SetScopedContextData("locale", "de");

await middleware.Invoke(context);

context.Result.Should().BeEquivalentTo(expected);
```
