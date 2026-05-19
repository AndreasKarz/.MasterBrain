# HotChocolate Migration Guide

> **Always fetch the latest migration guide first**: https://chillicream.com/docs/hotchocolate/v16/migrating/migrate-from-15-to-16

## v16 Migration — Breaking Changes Checklist

| # | Breaking Change | Action |
|---|---|---|
| 1 | Eager initialization by default | Remove `InitializeOnStartup()` calls; use `AddWarmupTask()` for warmup logic |
| 2 | Schema vs. app service separation | Register app services with `AddApplicationService<T>()` — affects `AddHttpRequestInterceptor`, `AddErrorFilter`, `AddDiagnosticEventListener` |
| 3 | Cache size configuration moved | Move `AddDocumentCache`/`AddOperationCache` to `ModifyOptions` on `IRequestExecutorBuilder` |
| 4 | Hash provider configuration moved | Move `AddSha256DocumentHashProvider` etc. to `IRequestExecutorBuilder` |
| 5 | `MaxAllowedNodeBatchSize` moved | Move to `AddGlobalObjectIdentification(options => ...)` |
| 6 | `IRequestContext` removed | Replace with `RequestContext`; use `OperationDocumentInfo` for document properties |
| 7 | Merged assemblies | Remove `HotChocolate.Execution` and `HotChocolate.Fetching` refs; use `HotChocolate.Types` |
| 8 | `ID<Type>` infers GraphQL name | Verify `[GraphQLName]` on types with `[ID<T>]` |
| 9 | `fieldCoordinate` → `coordinate` | Update error extension parsing code |
| 10 | `RunWithGraphQLCommandsAsync` returns int | Change to `return await app.RunWithGraphQLCommandsAsync(args)` |
| 11 | Scalar removals | `NegativeFloat`, `NonNegativeFloat`, `NegativeInt`, `NonPositiveInt`, `NonEmptyString`, `NonNegativeInt` removed — replace with custom or built-in |
| 12 | Byte/SignedByte rename | `Byte` → `UnsignedByte` (CLR `byte`), `SignedByte` → `Byte` (CLR `sbyte`) |
| 13 | `JsonElement` inferred as `Any` | Was `Json`, now `Any` — verify serialization |

**Approach**: Apply one breaking change at a time. Run schema build + snapshot tests after each change.

## Stitching → Fusion Migration Path

Target architecture for `src/Api/` — replaces runtime schema stitching with build-time Fusion composition.

| Phase | Task |
|---|---|
| **Phase 1** | Upgrade all domain services to HC v16 packages |
| **Phase 2** | Add `@key` directives to shared entity types per domain |
| **Phase 3** | Replace `QueryDelegationRewriterBase` with Fusion entity resolution |
| **Phase 4** | Replace `AddRemoteSchema` + runtime fetching with build-time Fusion composition |
| **Phase 5** | Remove `src/Api/src/Host/Stitching/`; gateway becomes thin Fusion gateway |

Key differences from stitching:
- **Entity-based** instead of resolver-based delegation
- **Build-time composition** instead of runtime schema fetching
- **No manual QueryDelegationRewriter** — Fusion handles routing automatically
- **`@key`, `@lookup`, `@require`** directives replace manual type merging

## Migration-Related Common Issues

| Issue | Cause | Fix |
|---|---|---|
| v16: `InitializeOnStartup` missing | Removed — now default behavior | Remove the call; use `AddWarmupTask()` |
| v16: app service not found in HC config | Service not cross-registered | Add `AddApplicationService<T>()` |
| v16: `HotChocolate.Execution` ref error | Assembly merged into `HotChocolate.Types` | Replace package reference |

## Fetching Latest Docs

Before any migration or upgrade work:

```
1. Fetch https://chillicream.com/docs/hotchocolate/v16/migrating/migrate-from-15-to-16
2. Fetch https://chillicream.com/docs/fusion/v16
3. Compare fetched content against the checklist above — if new breaking changes exist, follow the fetched docs
```
