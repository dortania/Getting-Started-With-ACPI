# Fixing NVRAM (SSDT-PMC)

* [What this SSDT does](#what-this-ssdt-does)
* [Methods to make this SSDT](#methods-to-make-this-ssdt)
 
## What this SSDT does

This SSDT is required for all "true" 300 series motherboards and newer(Z370 is excluded), it specifically brings back NVRAM support and requires very little configuration for the end user.

* B360
* B365
* H310
* H370
* Z390
* 400 series (Cometlake)
* 495 series (Icelake)

Oddly enough, desktop Z490 boards **DO NOT** need this SSDT. NVRAM just works out of the box for most users, if there's issues though it's recommended to try this SSDT

## Methods to make this SSDT

The main ways to make this SSDT:

* [Prebuilt](/Universal/nvram-methods/prebuilt.md)
* [Manual](/Universal/nvram-methods/manual.md)
