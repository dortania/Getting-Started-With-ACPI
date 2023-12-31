# Fixing Trackpads: Prebuilt

This is a one-size fits all solution where we basically trick our hardware into thinking it's booting Windows. The problem with this method is that it's common to break Windows booting if abused so avoid unless troubleshooting.

* [SSDT-XOSI](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-XOSI.aml)
* If you require a GPI0 stub, this must still be done manually.

* XOSI Rename(add this under config.plist -> ACPI -> Patch):

| Comment | String | Change _OSI to XOSI |
| :--- | :--- | :--- |
| Enabled | Boolean | YES |
| Count | Number | 0 |
| Limit | Number | 0 |
| Find | Data | 5f4f5349 |
| Replace | Data | 584f5349 |

**NOTE** This table only includes the fields that have been modified.  You still must include every field that OpenCore expects within the `ACPI->Patch` scheme.  Refer to the [Configuration Document](https://dortania.github.io/docs/latest/Configuration.html) for these fields and their failsafe values.
