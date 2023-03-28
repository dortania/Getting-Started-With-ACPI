# Fixing Trackpads: SSDTTime Method

This method involves using SSDTTime which automates most of the process. See here on how to use it: [SSDTs: Easy Way](/ssdt-methods/ssdt-easy.md)

To begin, you must have a valid `DSDT.aml` dump.  If you do not, you will have to run SSDTTime in either Windows or Linux booted outside of OpenCore or with the debug version of OpenCore, utilizing the `SysReport` quirk.  Once you have your `DSDT.aml` file, follow these steps:

* Select `A. XOSI`, then either the earliest version of Windows your system shipped with, or choose the Auto option.

Once done, SSDTTime will create several files inside its Results folder.  A SSDT-XOSI.**aml**, SSDT-XOSI.**dsl** and two plist files: `patches_OC.plist` and `patches_Clover.plist`.

The `patches_OC(Clover).plist` file contains the necessary patch required for your `SSDT-XOSI.aml` to function, so it must not be skipped.

The main things to note with this method:

* Doesn't really teach you anything
  * For most, this doesn't matter. But to some knowing what makes your hackintosh tick is part of the journey
* Can only make SSDT-XOSI
  * If you need SSDT-GPI0, then you still need to make it [manually](/Laptops/trackpad-methods/manual.md).

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)