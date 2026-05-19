### Playwright Tests
[Build Pipeline](https://dev.azure.com/swisslife/F2C/_build?definitionId=10983)
**30 Failed tests** (~={red}**+27**=~) 

### Logs
| LogLevel              | Service               | Message                           | Comment                                                                           |
| --------------------- | --------------------- | --------------------------------- | --------------------------------------------------------------------------------- |
| ~={red}**Critical**=~ | Fusion-Contract Host  | UService.Client.Paperless         |                                                                                   |
| ~={red}**Critical**=~ | Fusion-Document Host  | Nullable object must have a value | WMC Known issue                                                                   |
| ~={orange}**Error**=~ | Fusion-Profile Worker | Profile for userId xyz not found  | [Bug 949090](https://dev.azure.com/swisslife/CTRM/_workitems/edit/949090) created |

### FUMO
**SyncHub Fusion** => MarsBankingDocument 46 Audit Keys
**Fusion-Integration** => account-api 3 DeadLetters
**Fusion-Synchub** => MarsBankingDocument 8 failed
**spc-SyncHub** => requets_status 449 DeadLetters

### Releases
| Release         | How           | Comment                   |
| --------------- | ------------- | ------------------------- |
| Fusion-Contract | Mauri & Nazar | (still blocked by 2.10.0) |
| Fusion-UI       | Daria & Volha |                           |

 