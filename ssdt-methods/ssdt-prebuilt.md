# Pre-Built SSDTs

* [Power Management](#power-management)
* [Embedded Controllers](#embedded-controllers)
* [Trackpad](#trackpad)
* [Backlight](#backlight)
* [System Clock(AWAC)](#system-clockawac)
* [NVRAM(PMC)](#nvrampmc)

This is mainly for users who are having troubles either compiling, decompiling or understanding the overal process of ACPI. The main reasons you'd want to avoid is for the following:

* Slowing down the boot process
  * Mainly because these SSDTs have to go through every possible pathing
  * Fun fact: the prebuilt SSDT-EC-DESKTOP is 42 times larger than making the file yourself
* Doesn't always work
  * The SSDTs provided can only handle so many situations, and some may in fact not work
  * Mainly seen with SSDT-AWAC, as it assumes there is a way the RTC can be easily enabled
* Teaches nothing
  * This is the **biggest** issue as you have no real idea on how to troubleshoot or how to make these files down the line

Please refer to [Choosing the SSDTs](/ssdt-platform.md) page for which your system needs.

## Power Management

For Haswell and newer:

* [SSDT-PLUG-DRTNIA](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-PLUG-DRTNIA.aml)

For Ivy Bridge and older, see the [Optimizing Power Management page](https://dortania.github.io/OpenCore-Desktop-Guide/post-install/pm.html). This will be done *after* install. AMD CPU users **do not** need any SSDTs for power management.

## Embedded Controllers

For desktops:

* [SSDT-EC-USBX-DESKTOP](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-USBX-DESKTOP.aml)
  * For Skylake and newer and all AMD systems.
* [SSDT-EC-DESKTOP](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-DESKTOP.aml)
  * For Broadwell and older.

For laptops:

* [SSDT-EC-USBX-LAPTOP](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-USBX-LAPTOP.aml)
  * For Skylake and newer.
* [SSDT-EC-LAPTOP](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-EC-LAPTOP.aml)
  * For Broadwell and older.

## Trackpad

Used for enabling Windows only features in macOS, do note that the below patches will more than likely break Windows booting via OpenCore. I **highly** encourage you to make one yourself to prevent any issues down the line: [Trackpad GPI0](/Laptops/trackpad.md)

* [SSDT-XOSI](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-XOSI.aml)

* [XOSI-Rename.plist](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/XOSI-Rename.plist)
  * Note you'll need to add this into your config.plist under `ACPI -> Patch`:

| Comment | String | Change _OSI to XOSI |
| :--- | :--- | :--- |
| Enabled | Boolean | YES |
| Count | Number | 0 |
| Limit | Number | 0 |
| Find | Data | 5f4f5349 |
| Replace | Data | 584f5349 |

## Backlight

For laptops and all-in-one desktops, fixies brightness control support

* [SSDT-PNLF](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-PNLF.aml)
  * For most users.
* [SSDT-PNLF-CFL](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-PNLF-CFL.aml)
  * For Coffee Lake and newer.
  
## System Clock(AWAC)

Mainly needed for newer systems running AWAC based system clocks, mainly relavant for Z390 and newer(Gigabyte and AsRock however did backport it to Z370 with a BIOS update)

* [SSDT-AWAC](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-AWAC.aml)

The biggest issue with this prebuilt is that we're just guessing you both have an AWAC clock and that it can be turned off, I **highly** encourage you to make one yourself to really know whether you both need this and if it's going to work: [AWAC vs RTC](/Universal/awac.md)

## NVRAM(PMC)

Needed to bring back NVRAM support for Z390 and newer, **DO NOT USE ON Z370 or older**

* [SSDT-PMC](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-PMC.aml)

Reminder only the following need this SSDT:

* B360
* B365
* H310
* H370
* Z390
* 400 series (Comet Lake)
* 495 series (Icelake)
