# Getting started with ACPI

<img src="images/README-md/acpi-logo.png" width="512">

## A quick explainer on ACPI and how to make SSDTs

So what are DSDTs and SSDTs? Well, these are tables present in your firmware that outline hardware devices like USB controllers, CPU threads, embedded controllers, system clocks and such. A DSDT(Differentiated System Description Table) can be seen as the body holding most of the info with smaller bits of info being passed by the SSDT(Secondary System Description Table). You can think of the DSDT as the building blueprints with SSDTs being sticky notes outlining extra details to the project

> So why do we care about these tables?

macOS can be very picky about the devices present in the DSDT and so our job is to correct it. The main devices that need to be corrected for macOS to work properly:

* Embedded controllers(EC) 
   * All semi-modern intel machines have an EC exposed in their DSDT, with many AMD systems also having it exposed. These controllers are not compatible with macOS so then need to be hidden from macOS and replaced with a dummy EC when running macOS Catalina. 
   * With laptops, we still need these ECs so we rename them into what macOS would expect ECs to look like
* Plugin type
  * This allows XCPM to allowing us native CPU power management on **Intel** Haswell and newer CPUs, the SSDT will connect to the first thread of the CPU. Not meant for AMD
* AWAC system clock.
  * This applies to all 300 series motherboards including many Z370 boards, the specific issue is that newer boards ship with AWAC clock enabled. This is a problem because macOS cannot communicate with AWAC clocks, so this requires us to either force on the legacy RTC clock or if unavailable create a fake one for macOS to play with
* NVRAM SSDT
  * True 300 series motherboards(non-Z370) don't declare the FW chip as MMIO in ACPI and so the kernel ignores the MMIO region declared by the UEFI memory map. This SSDT brings back NVRAM support
* Backlight SSDT
   * Used for fixing backlight control support on laptops
* GPIO SSDT
   * Used for creating a stub to allow VoodooI2C to connect onto, for laptops only
* XOSI SSDT
   * Used for rerouting OSI calls to this SSDT, mainly used for tricking our hardware into thinking its booting Windows so we get better trackpad support. For laptops only
* IRQ SSDT and ACPI patches
   * Needed for fixing IRQ conflicts within the DSDT, for laptops mainly. SSDTTime exclusive

## What SSDTs do each platform need

Please see the **specific ACPI section of your config.plist**, all SSDTs needed are covered there with a breif explainer. But here's a very quick TL;DR:

### Desktop

**Ivy Bridge:**
* [CPU-PM](https://github.com/Piker-Alpha/ssdtPRGen.sh)(Run in Post-Install)
* [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl)

**Haswell:**
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl)

**Skylake:**
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl)

**Kabylake:**
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl)

**Coffeelake:**
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl)
* [SSDT AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl)
* [SSDT-PMC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl)

**AMD:**
* [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl)

### High End Desktop

**Haswell-E:**
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl)

**Broadwell-E:**
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl)

**Skylake-X:**
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl)
* [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl)

### Laptop

**Ivy Bridge:**
* [EC ACPI Patch](/Laptops/laptop-ec.md)
* [CPU-PM](https://github.com/Piker-Alpha/ssdtPRGen.sh)
* [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl)
* [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml)
* [IRQ SSDT](https://github.com/corpnewt/SSDTTime)

**Haswell:**
* [EC ACPI Patch](/Laptops/laptop-ec.md)
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl)
* [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml)
* [IRQ SSDT](https://github.com/corpnewt/SSDTTime)

**Broadwell:**
* [EC ACPI Patch](/Laptops/laptop-ec.md)
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl)
* [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml)
* [IRQ SSDT](https://github.com/corpnewt/SSDTTime)

**Skylake:**
* [EC ACPI Patch](/Laptops/laptop-ec.md)
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl)
* [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml)
* [IRQ SSDT](https://github.com/corpnewt/SSDTTime)

**Kabylake:**
* [EC ACPI Patch](/Laptops/laptop-ec.md)
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl)
* [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml)
* [IRQ SSDT](https://github.com/corpnewt/SSDTTime)

**Coffeelake(8th Gen):**
* [EC ACPI Patch](/Laptops/laptop-ec.md)
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl)
* [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml)
* [IRQ SSDT](https://github.com/corpnewt/SSDTTime)

**Coffeelake(9th Gen):**
* [EC ACPI Patch](/Laptops/laptop-ec.md)
* [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)
* [SSDT AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl)
* [SSDT-PMC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl)
* [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl)
* [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml)
* [IRQ SSDT](https://github.com/corpnewt/SSDTTime)
