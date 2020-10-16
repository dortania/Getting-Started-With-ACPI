# Fixing System Clocks: Prebuilt

By far the easiest method, all you need to do is download the following file:

* [SSDT-AWAC.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-AWAC.aml)
  * For most users
* [SSDT-RTC0-RANGE-HEDT](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-RTC0-RANGE-HEDT.aml)
  * For Intel's X99 and X299 platforms

Main things to note with this method:

* Assumes you both have an AWAC clock and it can be easily turned off with the RTC replacing it, **this may not always work**
  * This only applies to SSDT-AWAC
  * SSDT-RTC0-RANGE instead relies on known RTC names, and can only handle so many edge cases
* Doesn't really teach you anything
  * For most, this doesn't matter. But to some knowing what makes your hackintosh tick is part of the journey

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
