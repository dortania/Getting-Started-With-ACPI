# Getting started with ACPI

<img src="images/README-md/acpi-logo.png" width="512">

## A quick explainer on ACPI

So what are DSDTs and SSDTs? Well, these are tables present in your firmware that outline hardware devices like USB controllers, CPU threads, embedded controllers, system clocks and such. A DSDT(Differentiated System Description Table) can be seen as the body holding most of the info with smaller bits of info being passed by the SSDT(Secondary System Description Table). You can think of the DSDT as the building blueprints with SSDTs being sticky notes outlining extra details to the project

You can read more about ACPI and it's spec here: [ACPI 6.3 Manual](https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf)

> So why do we care about these tables?

macOS can be very picky about the devices present in the DSDT and so our job is to correct it. The main devices that need to be corrected for macOS to work properly:

* Embedded controllers(EC)
  * All semi-modern intel machines have an EC (usually called H\_EC, ECDV, EC0, etc...) exposed in their DSDT, with many AMD systems also having it exposed. These controllers are generally not compatible with macOS and can cause panics, so then need to be hidden from macOS. macOS Catalina requires a device named `EC` to be present though, so a dummy EC is created.
  * With laptops, the actual embedded controller still needs to be enabled for battery and hotkeys to work, and renaming the EC can additionally cause issues with windows, so creating a fake EC without disabling the real embedded controller is preferable to renaming.
* Plugin type
  * This allows the use of XCPM providing native CPU power management on **Intel** Haswell and newer CPUs, the SSDT will connect to the first thread of the CPU. Not meant for AMD
* AWAC system clock.
  * This applies to all 300 series motherboards including many Z370 boards, the specific issue is that newer boards ship with AWAC clock enabled. This is a problem because macOS cannot communicate with AWAC clocks, so this requires us to either force on the legacy RTC clock or if unavailable create a fake one for macOS to play with
* NVRAM SSDT
  * True 300 series motherboards(non-Z370) don't declare the FW chip as MMIO in ACPI and so the kernel ignores the MMIO region declared by the UEFI memory map. This SSDT brings back NVRAM support
* Backlight SSDT
  * Used for fixing backlight control support on laptops
* GPIO SSDT
  * Used for creating a stub to allow VoodooI2C to connect onto, for laptops only
* XOSI SSDT
  * Used for rerouting OSI calls to this SSDT, mainly used for tricking our hardware into thinking its booting Windows so we get better trackpad support. This is a very hacky solution known for breaking Windows boot, use the GPIO SSDT instead. Usage of XOSI will not be covered in this guide
* IRQ SSDT and ACPI patches
  * Needed for fixing IRQ conflicts within the DSDT, for laptops mainly. SSDTTime exclusive

## What SSDTs do each platform need

Please see the **specific ACPI section of your config.plist**, all SSDTs needed are covered there with a breif explainer. But here's a very quick TL;DR:

### Desktop

| SSDT | IvyBridge | Haswell/Broadwell | Skylake | KabyLake | CoffeeLake | CometLake | AMD(15/16/17h) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **CPU** | [CPU-PM](https://github.com/Piker-Alpha/ssdtPRGen.sh)(Run in Post-Install) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | N/A |
| **EC** | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) |
| **AWAC** | N/A | N/A | N/A | N/A | [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) | [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) | N/A |
| **NVRAM** | N/A | N/A | N/A | N/A | [SSDT-PMC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl) | [SSDT-PMC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl) | N/A |

### High End Desktop

| SSDT | IvyBridge-E | Haswell-E | Broadwell-E | Skylake-X |
| :--- | :--- | :--- | :--- | :--- |
| **CPU** | [CPU-PM](https://github.com/Piker-Alpha/ssdtPRGen.sh)(Run in Post-Install) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) |
| **EC** | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) |
| **AWAC** | N/A | N/A | N/A | [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) |

### Laptop

| SSDT | IvyBridge | Haswell | Broadwell | Skylake | KabyLake | CoffeeLake(8thGen) | Coffee/Comet/IceLake(9/10thGen) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **CPU** | [CPU-PM](https://github.com/Piker-Alpha/ssdtPRGen.sh)(Run in Post-Install) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) |
| **EC** | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) |
| **Backlight** | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF-CFL](https://i.applelife.ru/2019/12/463488_SSDT-PNLFCFL.aml.zip) | [SSDT-PNLF-CFL](https://i.applelife.ru/2019/12/463488_SSDT-PNLFCFL.aml.zip) |
| **I2C TrackPad** | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) |
| **AWAC** | N/A | N/A | N/A | N/A | N/A | N/A | [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) |
| **NVRAM** | N/A | N/A | N/A | N/A | N/A | N/A | [SSDT-PMC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl) |
| **IRQ Patch** | [IRQ SSDT](https://github.com/corpnewt/SSDTTime) | [IRQ SSDT](https://github.com/corpnewt/SSDTTime) | [IRQ SSDT](https://github.com/corpnewt/SSDTTime) | N/A | N/A | N/A | N/A |
