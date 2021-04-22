# Fixing NVRAM (SSDT-PMC)

[[toc]]

## What this SSDT does

This SSDT is required for all "true" 300 series motherboards(Z370 is excluded), it specifically brings back NVRAM support and requires very little configuration for the end user.

* B360
* B365
* H310
* H370 (HM370 shouldn't require this)
* Z390

10th gen motherboards **do not** need this SSDT, NVRAM's native on these platforms.

## Methods to make this SSDT

The main ways to make this SSDT:

* [Prebuilt](/Universal/nvram-methods/prebuilt.md)
* [SSDTTime](/Universal/nvram-methods/ssdttime.md)
* [Manual](/Universal/nvram-methods/manual.md)
