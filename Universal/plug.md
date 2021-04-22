# Fixing Power Management (SSDT-PLUG)

[[toc]]
## What this SSDT does

The purpose of SSDT-PLUG is to allow the kernel's XCPM(XNU's CPU Power Management) to manage our CPU's power management. It's pretty self explanatory why you'd want this.

**Note**: SSDT-PLUG is only compatible with Intel's Haswell and newer CPUs, Sandy Bridge and Ivy Bridge will need to follow the [ssdtPRgen method](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#sandy-and-ivy-bridge-power-management)(in post-install) while AMD users should not use this(unless attempting to attach AGPM which is outside the scope of Dortania's guides)

## Methods to make this SSDT

For SSDT-PLUG, there are 3 methods you can choose from:

* [Prebuilt](/Universal/plug-methods/prebuilt.md)
* [SSDTTime](/Universal/plug-methods/ssdttime.md)
* [Manual](/Universal/plug-methods/manual.md)
