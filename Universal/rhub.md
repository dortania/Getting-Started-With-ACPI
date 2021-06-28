# Fixing USB

[[toc]]

## What this SSDT does

So on 400 series motherboards, certain OEMs have broken the ACPI spec and this results in issues when booting into macOS. To fix this, we'll want to turn off the RHUB device and force macOS to manually rebuild the ports.

The following platforms will require fixing:

* Mobile Icelake(currently Dell and Lenovo are the 2 known with this issue)
* Asus Z490 (Gigabyte and AsRock users are fine, whether MSI currently this is unknown)

## Methods to make this SSDT

For the RHUB fix, there are 3 methods you can choose from:

* [Prebuilt](/Universal/rhub-methods/prebuilt.md)
* [SSDTTime](/Universal/rhub-methods/ssdttime.md)
* [Manual](/Universal/rhub-methods/manual.md)
