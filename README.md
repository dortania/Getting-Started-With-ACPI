# Getting started with ACPI

Last edited: January 30, 2020

## A quick explainer on ACPI and how to make SSDTs

So what are DSDTs and SSDTs? Well, these are tables present in your firmware that outline hardware devices like USB controllers, CPU threads, embedded controllers, system clocks and such. A DSDT(Differentiated System Description Table) can be seen as the body holding most of the info with smaller bits of info being passed by the SSDT(Secondary System Description Table)

> So why do we care about these tables?

macOS can be very picky about the devices present in the DSDT and so our job is to correct it. The main devices that need to be corrected for macOS to work properly:

* Embedded controllers(EC) 
  * All semi-modern intel machines have an EC exposed in their DSDT, with many AMD systems also having it exposed. These controllers are not compatible with macOS so then need to be hidden from macOS and replaced with a dummy EC when running macOS Catalina
* Plugin type
  * This is used to enable native CPU power management on **Intel** Haswell and newer CPUs, the SSDT will connect to the first thread of the CPU. Not meant for AMD
* AWAC system clock.
  * This applies to all 300 series motherboards including Z370 boards, the specific issue is that newer boards ship with AWAC clock enabled. This is a problem because macOS cannot communicate with AWAC clocks, so this requires us to either force on the Legacy RTC clock or if unavailable create a fake one for macOS to play with
* NVRAM SSDT
  * True 300 series motherboards(non-Z370) don't declare the FW chip as MMIO in ACPI and so XNU ignores the MMIO region declared by the UEFI memory map. This SSDT brings back NVRAM support and uses the scope `PCI0.LPCB`, so some users may need to adjust
* GPIO SSDT
   * Used for creating a stub to allow VoodooI2C to connect onto, for laptops only
* XOSI SSDT
* Used for rerouting OSI calls to this SSDT, mainly used for tricking our hardware into thinking its booting Windows so we get better trackpad support. For laptops only
* IRQ SSDT and ACPI patch
   * Needed for fixing IRQ conflicts within the DSDT, for laptops only

## What SSDTs do each platform need

Please see the **specific ACPI section of your config.plist**, all SSDTs needed are covered there with a breif explainer.
