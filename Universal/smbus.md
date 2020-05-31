# Fixing SMBus support (SSDT-SBUS-MCHC)

* [What this SSDT does](#what-this-ssdt-does)
* [Methods to make this SSDT](#methods-to-make-this-ssdt)

## What this SSDT does

This section of the guide refers to fixing AppleSMBus support in macOS, what is AppleSMBus? Well this mainly handles the System Management Bus, which has many functions like:

* AppleSMBusController
  * Aids with correct temperature, fan, voltage, ICH, etc readings
* AppleSMBusPCI
  * Same idea as AppleSMBusController except for low bandwidth PCI devices
* Memory Reporting
  * Aids in proper memory reporting and can aid in getting better kernel panic details if memory related
* Other things SMBus does: [SMBus wiki](https://en.wikipedia.org/wiki/System_Management_Bus)

For install purposes, this SSDT isn't needed but for post-install it's recommended to put the final touches on your hack.

## Methods to make this SSDT

To make this SSDT, you only got 1 method: Doing it manually

* [Manual](/Universal/smbus-methods/manual.md)
