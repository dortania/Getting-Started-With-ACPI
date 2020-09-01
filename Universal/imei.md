# Fixing IMEI (SSDT-IMEI)

- [Fixing IMEI (SSDT-IMEI)](#fixing-imei-ssdt-imei)
  - [What this SSDT does](#what-this-ssdt-does)
  - [Methods to make this SSDT](#methods-to-make-this-ssdt)

## What this SSDT does

The purpose of SSDT-IMEI is:

* When mixing Ivy Bridge CPUs with 6 series motherboard, we get an issue where the IMEI device becomes incompatible with macOS. Specifically the device-id won't be recognized and this is a very important issue as macOS relies on the IMEI device for iGPU drivers.
  * The same applies when mixing Sandy Bridge motherboards with 7 series motherboards
* An extra issue that may pop up is that the IMEI won't appear in ACPI, which can lead to more issues as macOS expects there to be an ACPI device to apply device-id's. So to resolve, we'll want to verify if we have an IMEI device, and if not create a new device.


## Methods to make this SSDT

For the IMEI fix, there are 2 methods you can choose from:

* [Prebuilt](/Universal/imei-methods/prebuilt.md)
  * The prebuilt are a bit bloated. It's recommended to use the method below.
* [Manual](/Universal/imei-methods/manual.md)