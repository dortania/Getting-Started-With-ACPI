# Fixing Backlight: SSDTTime Method

This method involves using SSDTTime which automates most of the process. See here on how to use it: [SSDTs: Easy Way](/ssdt-methods/ssdt-easy.md)

To begin, you must have a valid `DSDT.aml` dump.  If you do not, you will have to run SSDTTime in either Windows or Linux booted outside of OpenCore or with the debug version of OpenCore utilizing the `SysReport` quirk.  Once you have your `DSDT.aml` file, follow these steps:

* Select `0. PNLF`, then it will ask a series of questions regarding what platform you have.  Once you choose a proper `_UID`, SSDTTime will find your GPU's ACPI path, and properly create a PNLF device at that location.  An added bonus of SSDTTime is that it will search your entire DSDT for any references to PNLF anywhere and rename them so that any conflicts are removed as well.

[](../../images/Laptops/backlight-md/ssdttime_pnlf.png)

Once done, SSDTTime will create several files inside its Results folder.  A SSDT-PNLF.**aml**, SSDT-PNLF.**dsl** and may create two plist files: `patches_OC.plist` and `patches_Clover.plist`.

The `patches_OC(Clover).plist` file contains the necessary patch required for your `SSDT-PNLF.aml` to function, so it must not be skipped.

The main things to note with this method:

* Doesn't really teach you anything
  * For most, this doesn't matter. But to some knowing what makes your hackintosh tick is part of the journey

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
