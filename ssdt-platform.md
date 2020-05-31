# What SSDTs do each platform need

Please see the **specific ACPI section of your config.plist**, all SSDTs needed are covered there with a brief explainer. But here's a very quick TL;DR:

* [Desktop](#desktop)
* [High End Desktop](#high-end-desktop)
* [Laptop](#laptop)

## Desktop

| SSDT | IvyBridge | Haswell/Broadwell | Skylake | KabyLake | CoffeeLake | CometLake | AMD(15/16/17h) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **CPU** | [CPU-PM](https://github.com/Piker-Alpha/ssdtPRGen.sh)(Run in Post-Install) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | N/A |
| **EC** | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) |
| **AWAC** | N/A | N/A | N/A | N/A | [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) | [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) | N/A |
| **NVRAM** | N/A | N/A | N/A | N/A | [SSDT-PMC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl) | N/A | N/A |

## High End Desktop

| SSDT | IvyBridge-E | Haswell-E | Broadwell-E | Skylake-X |
| :--- | :--- | :--- | :--- | :--- |
| **CPU** | [CPU-PM](https://github.com/Piker-Alpha/ssdtPRGen.sh)(Run in Post-Install) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) |
| **EC** | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) |
| **AWAC** | N/A | N/A | N/A | [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) |

## Laptop

| SSDT | IvyBridge | Haswell | Broadwell | Skylake | KabyLake | CoffeeLake(8thGen) | Coffee/Comet/IceLake(9/10thGen) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **CPU** | [CPU-PM](https://github.com/Piker-Alpha/ssdtPRGen.sh)(Run in Post-Install) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) | [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) |
| **EC** | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) | [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl) |
| **Backlight** | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) | [SSDT-PNLF-CFL](https://i.applelife.ru/2019/12/463488_SSDT-PNLFCFL.aml.zip) | [SSDT-PNLF-CFL](https://i.applelife.ru/2019/12/463488_SSDT-PNLFCFL.aml.zip) |
| **I2C TrackPad** | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) | [SSDT-GPI0](https://github.com/hackintosh-guides/vanilla-laptop-guide/tree/master/Misc-files/SSDT-GPIO.aml) |
| **AWAC** | N/A | N/A | N/A | N/A | N/A | N/A | [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) |
| **NVRAM** | N/A | N/A | N/A | N/A | N/A | N/A | [SSDT-PMC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl) |
| **IRQ Patch** | [IRQ SSDT](https://github.com/corpnewt/SSDTTime) | [IRQ SSDT](https://github.com/corpnewt/SSDTTime) | [IRQ SSDT](https://github.com/corpnewt/SSDTTime) | N/A | N/A | N/A | N/A |

## [SSDT Creation](/ssdt-methods/ssdt-methods.md)
