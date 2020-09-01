# Fixing System Clocks (SSDT-AWAC/RTC0)

* [What this SSDT does](#what-this-ssdt-does)
* [Methods to make this SSDT](#methods-to-make-this-ssdt)

## What this SSDT does

The purpose of SSDT-AWAC/RTC0 is to fix the system clocks found on newer hardware, mainly found in the following:

* B360
* B365
* H310
* H370
* Z370 (Gigabyte and AsRock boards with newer BIOS versions)
* Z390
* B460
* Z490
* 400 series (Comet Lake, including Z490)
* 495 series (Icelake)
* X299X (10th Gen refresh, AsRock and Asus don't use the -x naming so you'll need to double check)

SSDT-AWAC tries to re-enable the old RTC clock that is compatible with macOS, while SSDT-RTC0 will instead create a "fake" RTC clock if there is no legacy one to enable.

## Methods to make this SSDT

For the RTC fix, there are 3 methods you can choose from:

* [Prebuilt](/Universal/awac-methods/prebuilt.md)
* [SSDTTime](/Universal/awac-methods/ssdttime.md)
* [Manual](/Universal/awac-methods/manual.md)
