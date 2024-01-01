# Fixing Power Management and Processor Definition (SSDT-PLUG-ALT)

* [Fixing Power Management and Processor Definition (SSDT-PLUG-ALT)](#fixing-power-management-and-processor-definition-ssdt-plug-alt)
  * [What this SSDT does](#what-this-ssdt-does)
  * [Methods to make this SSDT](#methods-to-make-this-ssdt)

## What this SSDT does

The purpose of SSDT-PLUG-ALT is to allow the kernel's XCPM (XNU's CPU Power Management) to manage our CPU's power management. It's pretty self explanatory why you'd want this. In addition to that, newer boards such as the Intel 600 series define CPU objects as `Device` according to the new ACPI 5.0 specification, but macOS expects them to be defined as `Processor`. This SSDT fixes this issue by defining `Processor` objects for macOS.

## Methods to make this SSDT

For SSDT-PLUG-ALT, there are 3 methods you can choose from:

* [Prebuilt](/Universal/plug-alt-methods/prebuilt.md)
* [Manual](/Universal/plug-alt-methods/manual.md)
