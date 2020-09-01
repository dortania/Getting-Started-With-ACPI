# Pre-Built SSDTs

* [Power Management](#power-management)
  * [B550 fix](#b550-fix)
* [Embedded Controllers](#embedded-controllers)
* [Trackpad](#trackpad)
* [Backlight](#backlight)
* [System Clock(AWAC)](#system-clockawac)
* [NVRAM(PMC)](#nvrampmc)
* [USB(RHUB)](#usbrhub)
* [IMEI](#imei)

This is mainly for users who are having troubles either compiling, decompiling or understanding the overall process of ACPI. The main reasons you'd want to avoid is for the following:

* Slowing down the boot process
  * Mainly because these SSDTs have to go through every possible pathing
  * At most, this only adds 2 seconds to the boot process, and does not affect macOS itself
* Doesn't always work
  * The SSDTs provided can only handle so many situations, and some may in fact not work
  * Mainly seen with SSDT-AWAC, as it assumes there is a way the RTC can be easily enabled
* Teaches nothing
  * This is the **biggest** issue as you have no real idea on how to troubleshoot or how to make these files down the line

Please refer to [Choosing the SSDTs](/ssdt-platform.md) page for which your system needs.

## Power Management

For Haswell and newer:

* [SSDT-PLUG-DRTNIA](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-PLUG-DRTNIA.aml)

For Ivy Bridge and older, see the [Optimizing Power Management page](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html). This will be done *after* install. AMD CPU users **do not** need any SSDTs for power management.

### B550 and A520 Fix

For AMD B550 and A520 users, you **must** include this SSDT to boot:

* [SSDT-CPUR](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-CPUR.aml)

Note that X570 and older boards do not need this SSDT.

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

Used for enabling Windows only features in macOS with I2C trackpads, do note that the below patches will more than likely break Windows booting via OpenCore(this issue is mitigated if booting by BIOS instead). We **highly** encourage you to make one yourself to prevent any issues down the line: [Trackpad GPI0](/Laptops/trackpad.md)

Note that PS2 keyboards and trackpads shouldn't need this SSDT+Patch.

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

Mainly needed for newer systems running AWAC based system clocks, mainly relevant for Z390 and newer(Gigabyte and AsRock however did back-port it to Z370 with a BIOS update)

* [SSDT-AWAC](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-AWAC.aml)

The biggest issue with this prebuilt is that we're just guessing you both have an AWAC clock and that it can be turned off, I **highly** encourage you to make one yourself to really know whether you both need this and if it's going to work: [AWAC vs RTC](/Universal/awac.md)

## NVRAM(PMC)

Needed to bring back NVRAM support for Z390 , **DO NOT USE ON Z370 or older or Z490 and newer**

Note: Comet Lake, Ice Lake and newer do not need this.

* [SSDT-PMC](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-PMC.aml)

Reminder only the following need this SSDT:

* B360
* B365
* H310
* H370
* Z390

## USB(RHUB)

Needed for 10th gen Asus motherboards, Gigabyte and AsRock motherboards don't need this:

* [SSDT-RHUB.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-RHUB.aml)


## IMEI

Required when pairing either:

* Sandy Bridge CPU with 7 series motherboard
  * ie. B75, Q75, Z75, H77, Q77, Z77

* Ivy Bridge CPU with 6 series motherboard
  * ie. H61, B65, Q65, P67, H67, Q67, Z68
  
Simply grab the following SSDT:

* [SSDT-IMEI.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-IMEI.aml)