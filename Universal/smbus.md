# Fixing SMBus support

This section of the guide refers to fixing AppleSMBus support in macOS, what is AppleSMBus? Well this mainly handles the System Management Bus, which has many functions like:


* AppleSMBusController
   * Aids with correct temperature, fan, voltage, ICH, etc readings
* AppleSMBusPCI
   * Same idea as AppleSMBusController except for low bandwidth PCI devices
* Memory Reporting
   * Aids in proper memory reporting and can aid in getting better kernel panic details if memory related
* Other things SMBus does: [SMBus wiki](https://en.wikipedia.org/wiki/System_Management_Bus)   

For install purposes, this SSDT isn't needed but for post-install it's recommended to put the final touches on your hack.


So to get started, we'll want to grab our SMBus SSDT:

* [SSDT-SBUS-MCHC.dsl](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-SBUS-MCHC.dsl)

So the important parts we care about are:

```text
External (_SB_.PCI0, DeviceObj) <- Rename this
External (_SB_.PCI0.SBUS.BUS0, DeviceObj) <- Rename this

Scope (_SB.PCI0) <- Rename this
{
    Device (MCHC)
    {
        Name (_ADR, Zero)  // _ADR: Address
    }
}

Device (_SB.PCI0.SBUS.BUS0) <- Rename this
```
To find the correct pathing for your devices, grab [Hackintool](https://www.tonymacx86.com/threads/release-hackintool-v3-x-x.254559/) ([Github link](https://github.com/headkaze/Hackintool)) and head to the PCI tab:

![](https://cdn.discordapp.com/attachments/683011276938543134/694592079728214024/Screen_Shot_2020-03-31_at_10.58.36_AM.png)

Look for the SMBus device under Subclass, then look beside and you'll see the ACPI path(under IOReg Name). To convert , omit `@...`

* `/PC00@0/SMBS@1F,4` -> `PC00.SMBS`


Once finished, it'll look something like this:

```text
External (_SB_.PC00, DeviceObj) <- Renamed
External (_SB_.PC00.SMBS.BUS0, DeviceObj) <- Renamed

/* <- Comment out if on Sandy Bridge or newer
Scope (_SB.PC00) 
{
    Device (MCHC)
    {
        Name (_ADR, Zero)  // _ADR: Address
    }
}
*/ <- Close the comment 

Device (_SB.PC00.SMBS.BUS0) <- Renamed
```

**Note**: The MCHC is actually the DRAM controller, similar idea to SMBus for fixing memory reporting


## [Now you're ready to compile the SSDT!](/Manual/compile.md)