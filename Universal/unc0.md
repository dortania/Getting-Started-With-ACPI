# Fixing Uncore Bridges (SSDT-UNC)

[[toc]]

## What this SSDT does

This SSDT is required for all X99 and many X79 boards, it specifically disables unused devices in ACPI ensuing IOPCIFamily doesn't kernel panic. This requires very little configuration for the end user.

* X79
* C602
* X99
* C612

## Methods to make this SSDT

The main ways to make this SSDT:

* [Prebuilt](/Universal/unc0-methods/prebuilt.md)
* [Manual](/Universal/unc0-methods/manual.md)
