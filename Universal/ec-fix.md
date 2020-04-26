
# Fixing Embedded Controller

What we'll be doing is creating a fake Embedded Controller (EC) to satisfy macOS Catalina's EC addiction, and disabling the EC on desktops to prevent panics and crashes.

You'll want to begin by grabbing either one of these uncompiled SSDT files:

* [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl)
  * For Skylake and newer and all AMD systems
* [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl)
  * For Broadwell and older

### Fixing the Path

For Intel systems, the path is *likely* correct, though it's worth double checking. You will want to find your current EC by opening your decompiled DSDT and searching for `PNP0C09`. You should get a result similar to this:

![](/images/Desktops/pnp.png)

> Note: If your EC device happens to already be named `EC` in your DSDT, you do not need SSDT-EC at all and can move on.

As you can see, `PNP0C09` is found under the `EC0` device and `_SB.PC00.LPC0` scope. Looking at the SSDT though, this differs from the path `_SB_.PCI0.LPCB` seen within. This will need to be corrected in the SSDT to match what is found in the DSDT. Using the above image, you should get something similar to this:

```text
Scope (\_SB.PC00.LPC0) <- Rename this
{
    Device (EC) <- DO NOT RENAME THIS
    {
        Name (_HID, "ACID0001")  // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F) // Enable our Fake EC only when in macOS
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}
```

Generally, `PC00.LPC0` is most common on Intel HEDT while `PCI0.SBRG` is most common on AMD. **Always verify your path and device. DO NOT ASSUME**.
If you are having issues finding the Scope, you can use the below Hardware IDs or Addresses:

* Finding the LowPinCount path:
  * Intel: Search `Name (_ADR, 0x001F0000)`
  * AMD: Search `Name (_ADR, 0x00140003)`
* Finding the PCI path:
  * Intel: Search `PNP0A08` (If multiple show up, use the first one)
  * AMD: Assume `PCI0`(most AMD DSDTs don't declare the PCI path directly)

**Make sure that you do not rename `Device (EC)`. This is what macOS Catalina looks for to boot!**

**Desktop users, continue down below to disabling your actual EC**

### Disabling real EC (Desktops only)

For desktops, it's preferable to disable the actual Embedded Controller as it is not supported by macOS 100% and is known to sometimes cause panics. If we use the screenshot above, we'll see that the device name is `EC0`. Other common names for ECs are `H_EC`, `ECDV`, and `EC0`. You'll want to grab your SSDT again and uncomment the `_STA` method to disable it (remove the `/*` and `*/` around it):

```text
/* <- REMOVE THIS
External (_SB_.PCI0.LPCB.EC0, DeviceObj) <- Rename this

   Scope (\_SB.PCI0.LPCB.EC0) <- Rename this
   {
      Method (_STA, 0, NotSerialized) // _STA: Status
      {
         If (_OSI ("Darwin")) // Darwin = macOS
         {
            Return (0) // Hides our real EC only when in macOS
         }
         Else
      {
      Return (0x0F)
     }
  }
}
*/ <- REMOVE THIS
```

Like above, make sure the path is correct for the External and Scope field.

### What happens if device in the DSDT is already named `EC`

For laptops, you don't need SSDT-EC at all.

### What happens if multiple `PNP0C09` show up

When this happens you need to figure out which is the main and which is not, it's fairly easy to figure out. Check each controller for the following properties:

* `_HID` (Hardware ID)
* `_CRS` (Current Resource Settings)
* `_GPE` (General Purpose Events)

Note if you have an STA Method as well, see below: [STA Edge Case](/Desktops/desktop-ec.md#sta-edge-case)

### What happens if no `PNP0C09` show up?

This means you only need to fake an Embedded Controller rather so that AppleBusPowerController will load and handle USB power properly and continue booting. To make the actual SSDT, its *almost* plug and play as no uncommenting needed. The main thing that needs to be changed:

* LowPinCount path
* PCI path

We want to make sure the SSDT hooks into our DSDT correctly so we need to make sure the ACPI path is correct:

* Finding the LowPinCount path:
  * Intel: Search `Name (_ADR, 0x001F0000)`
  * AMD: Search `Name (_ADR, 0x00140003)`
* Finding the PCI path:
  * Intel: Search `PNP0A08` (If multiple show up, use the first one)
  * AMD: Assume `PCI0`(most AMD DSDTs don't declare the PCI path directly)

![](/images/Desktops/lpc.png)

Once you find out, change `PCI0.LPCB` to your correct path:

```text
Scope (\_SB.PC00.LPC0) <- Rename this
{
    Device (EC) <- DO NOT RENAME THIS
    {
        Name (_HID, "ACID0001")  // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F) // Enable our Fake EC only when in macOS
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}
```

![](/images/Desktops/ec.png)

For those having issues, you can also check `Device Manager -> CPU -> BIOS device Name`. Windows will only report the main EC so will save you some headache on that

### STA Edge Case

![Credit to rottenpants466](/images/Desktops/sta.png)

Do note that if your PNP0C09 device has a `Method (_STA` already you can skip down to "What happens if no `PNP0C09` show up?".
The reason for this is that the real EC is considered disabled already.

### Correcting USB Power

> Hey what about USBX? Do I need to do anything?

USBX is universal across all systems, it just creates a USBX device that forces USB power properties. This is crucial for fixing Mics, DACs, Webcams, Bluetooth Dongles and other high power draw devices. This is not mandatory to boot but should be added in post-install if not before. Note that it requires the EC functioning correctly and that USBX is only used on skylake+ systems - those on Broadwell and older can ignore.

## [Now you're ready to compile the SSDT!](/Manual/compile.md)
