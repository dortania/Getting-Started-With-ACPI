# Fixing Trackpads (SSDT-GPI0/XOSI)

[[toc]]

## What this SSDT does

This SSDT is used to force enable our GPI0 for VoodooI2C to connect onto.

With most modern laptop DSDTs, there's a variable called `GPEN` or `GPHD` which are used for setting the status of the GPI0 device. For us, we want to enable the device.

## Methods to make this SSDT

For the trackpad fix, there are 2 methods you can choose from:

* [Prebuilt](/Laptops/trackpad-methods/prebuilt.md)
* [Manual](/Laptops/trackpad-methods/manual.md)
