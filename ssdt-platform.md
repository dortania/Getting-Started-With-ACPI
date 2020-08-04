# What SSDTs do each platform need

Please see the **specific ACPI section of your config.plist**, all SSDTs needed are covered there with a brief explainer. But here's a very quick TL;DR:

- [What SSDTs do each platform need](#what-ssdts-do-each-platform-need)
  - [Desktop](#desktop)
  - [Laptop](#laptop)
  - [SSDT Creation](#ssdt-creation)

## Desktop

| Platforms | **CPU** | **EC** | **AWAC** | **NVRAM** | **USB** |
| :-------: | :-----: | :----: | :------: | :-------: | :-----: |
| SandyBridge | [CPU-PM](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#sandy-and-ivy-bridge-power-management) (Run in Post-Install) | [SSDT-EC](/Universal/ec-fix.html) | N/A | N/A | N/A |
| Ivy Bridge | ^^ | ^^ | N/A | N/A | N/A |
| Haswell | [SSDT-PLUG](/Universal/plug.html) | ^^ | ^^ | ^^ | ^^ |
| Broadwell | ^^ | ^^ | ^^ | ^^ | ^^ |
| Skylake | ^^ | [SSDT-EC-USBX](/Universal/ec-fix.html) | ^^ | ^^ | ^^ |
| Kaby Lake | ^^ | ^^ | ^^ | ^^ | ^^ |
| Coffee Lake | ^^ | ^^ | [SSDT-AWAC](/Universal/awac.html) | [SSDT-PMC](/Universal/nvram.html) | ^^ |
| Comet Lake | ^^ | ^^ | ^^ | N/A | [SSDT-RHUB](/Universal/rhub.html) |
| AMD (15/16/17h) | N/A | ^^ | N/A | ^^ | N/A |

## High End Desktop

| Platforms | **CPU** | **EC** | **AWAC** |
| :-------: | :-----: | :----: | :------: |
| Ivy Bridge-E | [SSDT-PLUG](/Universal/plug.html) | [SSDT-EC](/Universal/ec-fix.html) | N/A |
| Haswell-E | ^^ | [SSDT-EC-USBX](/Universal/ec-fix.html) | ^^ |
| Broadwell-E | ^^ | ^^ | ^^ |
| Skylake-X | ^^ | ^^ | [SSDT-AWAC](/Universal/awac.html) |

## Laptop

| Platforms | **CPU** | **EC** | **Backlight** | **I2C Trackpad** | **AWAC** | **USB** | **IRQ** |
| :-------: | :-----: | :----: | :-----------: | :--------------: | :------: | :-----: | :-----: |
| SandyBridge | [CPU-PM](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#sandy-and-ivy-bridge-power-management) (Run in Post-Install) | [SSDT-EC](/Universal/ec-fix.html) | [SSDT-PNLF](/Laptops/backlight.html) | [SSDT-GPI0](/Laptops/trackpad.html) | N/A | N/A | [IRQ SSDT](/Universal/irq.html) |
| Ivy Bridge | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ |
| Haswell | [SSDT-PLUG](/Universal/plug.html) | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ |
| Broadwell | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ |
| Skylake | ^^ | [SSDT-EC-USBX](/Universal/ec-fix.html) | ^^ | ^^ | ^^ | ^^ | N/A |
| Kaby Lake | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ |
| Coffee Lake (8th Gen) | ^^ | ^^ | [SSDT-PNLF-CFL](/Laptops/backlight.html) | ^^ | ^^ | ^^ | ^^ |
| Coffee Lake (9th Gen) | ^^ | ^^ | ^^ | ^^ | [SSDT-AWAC](/Universal/awac.html) | ^^ | ^^ |
| Comet Lake | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ | ^^ |
| Ice Lake | ^^ | ^^ | ^^ | ^^ | ^^ | [SSDT-RHUB](/Universal/rhub.html) | ^^ |

## [SSDT Creation](/ssdt-methods/ssdt-methods.md)
