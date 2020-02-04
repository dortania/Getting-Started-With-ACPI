# Fixing I2C

No configuration required, just drop the prebuilt file into your EFI: [SSDT-XOSI]()

Do note that this SSDT requires an ACPI patch as well:

Under `ACPI -> Patch`:

| Comment | String | Change _OSI to XOSI |
| :--- | :--- | :--- |
| Enabled | String | YES |
| Count | Number | 0 |
| Limit | Nuber | 0 |
| Find | Data | 5f4f5349 |
| Replace | Data | 584f5349 |

