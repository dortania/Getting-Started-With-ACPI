# Patching DMAR Table (DMAR.aml)

* [What this ACPI Table does](#what-this-acpi-table-does)
* [Methods to make this ACPI Table](#methods-to-make-this-acpi-table)

## What this ACPI Table does

The purpose of patching the DMAR table is to remove any Reserved Memory Regions within it.  This is necessary as `VT-d` is now required in Big Sur and newer for certain ethernet controllers utilizing DriverKit extensions; including but not limited to I225 based controllers, Aquantia Ethernet Controllers and some WiFi devices.  Now, in order for our patched ACPI Table to load properly we must also drop the current DMAR table residing in our firmware to allow our patched ACPI Table to take its place.

This is for any CPU that supports `VT-d` or Intel Virtualization Technology for Directed I/O.

## Methods to make this ACPI Table

To create this ACPI Table, there is currently 1 method available.

* [Manual](/Universal/dmar-methods/manual.md)