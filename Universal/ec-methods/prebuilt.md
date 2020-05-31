# Fixing Embedded Controllers: Prebuilt

By far the easiest way to fix your Embedded Controller is just downloading one of the files below:

**Desktop**:

* [SSDT-EC-USBX-DESKTOP](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-USBX-DESKTOP.aml)
  * For Skylake desktops and newer and AMD CPU based systems
* [SSDT-EC-DESKTOP](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-DESKTOP.aml)
  * For Broadwell desktops and older

**Laptops**:

* [SSDT-EC-USBX-LAPTOP.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-USBX-LAPTOP.aml)
  * For Skylake laptops and newer
* [SSDT-EC-LAPTOP.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-LAPTOP.aml)
  * For Broadwell laptops and older

The main things to note with this method:

* Quite Bloated
  * There's ACPI naming for every type, this means there's added delays in boot times
* Doesn't really teach you anything
  * For most, this doesn't matter. But to some knowing what makes your hackintosh tick is part of the journey

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to warp up:

* [**Cleanup**](/cleanup.md)
