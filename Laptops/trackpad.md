# Fixing Trackpads (SSDT-GPI0/XOSI)

* [What this SSDT does](#what-this-ssdt-does)
* [Methods to make this SSDT](#methods-to-make-this-ssdt)

## What this SSDT does

A big part of fixing I2C trackpads is enabling them within ACPI. For VoodooI2C to work, GPI0 needs to be enabled, as well as the Trackpad and I2C bus. The latter two devices are commonly disabled behind an OS check for Windows which need to be patched to work with macOS as well.

Common variables which are set are `OSYS`, `WIN8`, and `GPEN`. Often times, GPI0 is already enabled and requires no modification.

## Methods to make this SSDT

For the trackpad fix, there are only one method to choose from:

* [Manual](/Laptops/trackpad-methods/manual.md)
