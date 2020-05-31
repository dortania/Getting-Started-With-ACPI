# Fixing Trackpads: Prebuilt

This is a one-size fits all solution where we basically trick our hardware into thinking it's booting Windows. The problem with this method is that it's common to break Windows booting so avoid unless troubleshooting.

* [SSDT-XOSI](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-XOSI.aml)

* XOSI Rename(add this under config.plist -> ACPI -> Patch):

| Comment | String | Change _OSI to XOSI |
| :--- | :--- | :--- |
| Enabled | Boolean | YES |
| Count | Number | 0 |
| Limit | Number | 0 |
| Find | Data | 5f4f5349 |
| Replace | Data | 584f5349 |
