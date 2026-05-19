---
title: Fusion-UI Playwright GraphQL Interception
type: resource
status: active
created: 2026-05-11
updated: 2026-05-11
tags:
  - fusion-ui
  - playwright
  - e2e
  - graphql
  - testing
sensitivity: local
source: chat-session
review: 2026-06-11
---

# Fusion-UI Playwright GraphQL Interception

## Context

In Fusion-UI Infodesk Playwright E2E tests, impersonation via `SL.userid` / `dev-onepersonid` can affect contract data while `me.profile.personalData` may still come from the authenticated Selenium account. This can make manual checks and automated tests differ, especially when frontend rendering depends on `me.profile.personalData.birthDate`.

Observed case: PFXPlan age-restriction quick-access cards were hidden in Playwright although the contract payload itself was active and contained the purchase / plan-pension data. The root cause was the profile birth date used by the frontend age gate, not missing contract data.

## Lesson

For this class of E2E mismatch, do not change the test user or contract first. Inspect the Playwright trace GraphQL responses and compare whether `me.profile` and `me.contract` come from different effective contexts.

If only one profile field needs deterministic test control, prefer a narrow Playwright route interception that:

- registers before navigation;
- calls `route.fetch()` to keep the real backend response;
- patches only the specific GraphQL response shape and only when the target contract matches;
- leaves the real contract payload unchanged;
- fulfills with the modified JSON response.

## Pattern

Use a Page Object Model helper rather than raw interception in the test body. The test should express the business setup, for example: “mock profile age for this contract to 30 years”.

```typescript
await page.route('**/graphql', async (route) => {
  const response = await route.fetch();
  const responseJson = await response.json();

  if (responseJson?.data?.me?.contract?.number === contractNumber) {
    responseJson.data.me.profile.personalData.birthDate = birthDate;
  }

  await route.fulfill({response, json: responseJson});
});
```

## Verification

Run the focused test from the Infodesk widget after the interception is registered:

```powershell
yarn playwright install
yarn playwright test src/pension-fund/xplan/pfXPlanContractDetails70Plus.e2e.ts --project=chromium --reporter=line
```

Expected result: the PFXPlan retired negative test and under-age positive test pass. In the validated run, Playwright reported `3 tests passed` including setup/auth.

## Next Action

When PFXPlan age-related tests fail again, inspect the GraphQL trace before changing test data. Confirm whether the failing condition is driven by `me.profile.personalData.birthDate` or by real contract data.