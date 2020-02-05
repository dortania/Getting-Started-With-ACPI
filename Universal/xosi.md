# Fixing I2C

Used for tricking our hardware into unlocking Windows functionality inside macOS, mainly used for I2C devices.

No configuration required, just drop the prebuilt file into your EFI: [SSDT-XOSI](https://github.com/khronokernel/Getting-Started-With-ACPI/blob/master/extra-files/SSDT-XOSI.aml)

Do note that this SSDT requires an ACPI patch as well:

Under `ACPI -> Patch`:

| Comment | String | Change _OSI to XOSI |
| :--- | :--- | :--- |
| Enabled | String | YES |
| Count | Number | 0 |
| Limit | Nuber | 0 |
| Find | Data | 5f4f5349 |
| Replace | Data | 584f5349 |

