# Fixing Embedded Controller (SSDT-EC/USBX)

- [Fixing Embedded Controller (SSDT-EC/USBX)](#fixing-embedded-controller-ssdt-ecusbx)
  - [What this SSDT does](#what-this-ssdt-does)
  - [Methods to make this SSDT](#methods-to-make-this-ssdt)

## What this SSDT does

The purpose of SSDT-EC/UBX is a couple things:

* On desktops, the EC(or better known as the embedded controller) isn't compatible with AppleACPIEC driver, to get around this we disable this device when running macOS
* AppleBusPowerController will look for a device named `EC`, so we will want to create a fake device for this kext to load onto
  * AppleBusPowerController also requires a USBX device to supply USB power properties for Skylake and newer, so we will bundle this device in with the EC fix
* On laptops, the EC is used for hotkeys and battery so disabling this isn't all too ideal. Problem is our EC's name isn't compatible, so we will create a simple "fake" EC device that will satisfy Apple

So TL;DR:

* EC is embedded controller
* Desktops will want real EC off, and a fake EC created
* Laptops will just want an additional fake EC present
* Skylake and newer devices will want USBX as well

## Methods to make this SSDT

For the EC fix, there are 3 methods you can choose from:

* [Prebuilt](/Universal/ec-methods/prebuilt.md)
* [SSDTTime](/Universal/ec-methods/ssdttime.md)
* [Manual](/Universal/ec-methods/manual.md)
