# What SSDTs do each platform need

Please see the **specific ACPI section of your config.plist**, all SSDTs needed are covered there with a brief explainer. But here's a very quick TL;DR:

- [What SSDTs do each platform need](#what-ssdts-do-each-platform-need)
  - [Desktop](#desktop)
  - [Laptop](#laptop)
  - [SSDT Creation](#ssdt-creation)

## Desktop

| Platforms | **CPU** | **EC** | **AWAC** | **NVRAM** | **USB** |
| :-------: | :-----: | :----: | :------: | :-------: | :-----: |
| Ivy Bridge | [CPU-PM](https://dortania.github.io/OpenCore-Desktop-Guide/post-install/pm.html#sandy-and-ivy-bridge-power-management) (Run in Post-Install) | [SSDT-EC](/Universal/ec-fix.html) | N/A | N/A | N/A |
| Ivy Bridge-E | ^ | ^ | ^ | ^ | ^ |
| Haswell/Broadwell | [SSDT-PLUG](/Universal/plug.html) | ^ | ^ | ^ | ^ |
| Haswell-E | ^ | ^ | ^ | ^ | ^ |
| Broadwell-E | ^ | ^ | ^ | ^ | ^ |
| Skylake | ^ | [SSDT-EC-USBX](/Universal/ec-fix.html) | ^ | ^ | ^ |
| Skylake-X | ^ | ^ | ^ | ^ | ^ |
| Kabylake | ^ | ^ | ^ | ^ | ^ |
| CoffeeLake | ^ | ^ | [SSDT-AWAC]/Universal/awac.html) | [SSDT-PMC](/Universal/nvram.html) | ^ |
| CometLake | ^ | ^ | ^ | ^ | [SSDT-RHUB](/Universal/rhub.html) |
| AMD (15/16/17h) | N/A | ^ | N/A | N/A | N/A |

## Laptop

| Platforms | **CPU** | **EC** | **Backlight** | **I2C Trackpad** | **AWAC** | **USB** | **IRQ** |
| :-------: | :-----: | :----: | :-----------: | :--------------: | :------: | :-----: | :-----: |
| Ivy Bridge | [CPU-PM](https://dortania.github.io/OpenCore-Desktop-Guide/post-install/pm.html#sandy-and-ivy-bridge-power-management) (Run in Post-Install) | [SSDT-EC](/Universal/ec-fix.html) | [SSDT-PNLF](/Laptops/backlight.html) | [SSDT-GPI0](/Laptops/trackpad.html) | N/A | N/A | [IRQ SSDT](/Universal/irq.html) |
| Haswell | [SSDT-PLUG](/Universal/plug.html) | ^ | ^ | ^ | ^ | ^ | ^ |
| Broadwell | ^ | ^ | ^ | ^ | ^ | ^ | ^ |
| Skylake | ^ | [SSDT-EC-USBX](/Universal/ec-fix.html) | ^ | ^ | ^ | ^ | N/A |
| KabyLake | ^ | ^ | ^ | ^ | ^ | ^ | ^ |
| CoffeeLake (8th Gen) | ^ | ^ | [SSDT-PNLF-CFL](/Laptops/backlight.html) | ^ | ^ | ^ | ^ |
| CoffeeLake (9th Gen) | ^ | ^ | ^ | ^ | [SSDT-AWAC](/Universal/awac.html) | ^ | ^ |
| CometLake | ^ | ^ | ^ | ^ | ^ | ^ | ^ |
| IceLake | ^ | ^ | ^ | ^ | ^ | [SSDT-RHUB](/Universal/rhub.html) | ^ |

## [SSDT Creation](/ssdt-methods/ssdt-methods.md)
