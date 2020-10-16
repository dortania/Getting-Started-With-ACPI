# Fixing Embedded Controllers: SSDTTime

The second involves using SSDTTime which automates most of the process. See here on how to use it: [SSDTs: Easy Way](/ssdt-methods/ssdt-easy.md)

To get the SSDT-EC on desktops, run the following:

* `7. Dump DSDT` then run `2. FakeEC`

To get the SSDT-EC on laptops, run the following:

* `7. Dump DSDT` then run `3.  FakeEC Laptop`

This will provide you with some files, the main one you care about is SSDT-EC.**aml**. The DSDT and .dsl are only left for referencing or verification.

The main things to note with this method:

* Doesn't provide you the USBX property to fix power
  * This can easily be fixed by using this prebuilt file in addition to SSDT-EC: [SSDT-USBX.aml](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/SSDT-USBX.aml)
  * Note USBX is only needed for Skylake and newer
* Doesn't really teach you anything
  * For most, this doesn't matter. But to some knowing what makes your hackintosh tick is part of the journey

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
