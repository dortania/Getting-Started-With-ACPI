# Fixing NVRAM (SSDT-PMC)

* [What this SSDT does](#what-this-ssdt-does)
* [Methods to make this SSDT](#methods-to-make-this-ssdt)
 
## What this SSDT does

This SSDT is required for all "true" 300 series motherboards(Z370 is excluded), it specifically brings back NVRAM support and requires very little configuration for the end user.

* B360
* B365
* H310
* H370
* Z390

10th gen motherboards **do not** need this SSDT, NVRAM's native on these platforms.

## Methods to make this SSDT

The main ways to make this SSDT:

* [Prebuilt](/Universal/nvram-methods/prebuilt.md)
* [SSDTTime](/Universal/nvram-methods/ssdttime.md)
* [Manual](/Universal/nvram-methods/manual.md)