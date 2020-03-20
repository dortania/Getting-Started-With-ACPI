# Fixing NVRAM

This SSDT is required for all "true" 300 series motherboards and newer(Z370 is excluded), it specifically brings back NVRAM support and requires very little configuration for the end user.

* B360
* B365
* H310
* H370
* Z390
* 400 series (Cometlake)
* 495 series (Icelake) 

By default it uses `PCI0.LPCB` for the PCI and LowPinCount path. The device names can vary between `PC00` and `PCI0` for PCI path and `LPCB`, `LBC` and `LBC0` for  LowPinCount path. To see what you have:

* Finding the LowPinCount path: 
   * Intel: Search `Name (_ADR, 0x001F0000)`
* Finding the PCI path: 
   * Intel: Search `PNP0A08` (If multiple show up, use the first one)

![](https://cdn.discordapp.com/attachments/456913818467958789/670148514197667840/Screen_Shot_2020-01-23_at_11.08.30_PM.png)

## [Now you're ready to compile the SSDT!](/Manual/compile.md)
