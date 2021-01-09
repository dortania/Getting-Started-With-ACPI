# Fixing Power Management: Prebuilt

By far the easiest way to get SSDT-PLUG is just downloading the below file:

* [SSDT-PLUG-DRTNIA.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-PLUG-DRTNIA.aml)

This prebuilt file is just a precompiled version of [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-PLUG.dsl) provided by Acidanthera.

The main things to note with this method:

* Quite Bloated
  * There's ACPI naming for every type, this means there's added delays in boot times(though unnoticeable to most as it's generally 0.5 seconds longer)
* Doesn't really teach you anything
  * For most, this doesn't matter. But to some knowing what makes your hackintosh tick is part of the journey

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
