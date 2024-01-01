# Fixing Property Injection (SSDT-BRG0)

* [Fixing Property Injection (SSDT-BRG0)](#fixing-property-injection-ssdt-brg0)
  * [What this SSDT does](#what-this-ssdt-does)
  * [Methods to make this SSDT](#methods-to-make-this-ssdt)

## What this SSDT does

On some platforms, the PCI bridge your GPU is connected to is not defined.
This can prevent Device Properties being added to these devices from your config.plist.
This SSDT fixes that by defining the bridge device (BRG0) and your GPU under that bridge. 

## Methods to make this SSDT

For SSDT-BRG0, there's currently only one option:

* [SSDTTime](/Universal/brg0-methods/ssdttime.md)
