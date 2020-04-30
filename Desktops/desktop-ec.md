
# Fixing Embedded Controller (Desktop)

## You'll want to go to [SSDT-EC under the Universal tab](/Universal/desktop-ec.md) for the new SSDT-EC page

What we'll be doing is hiding our actual EC and creating a fake Embedded Comtroller for macOS to play with.

To find out what EC you have, open your decompiled DSDT and search for `PNP0C09`. This should give you a result like this:

![](/images/Desktops/pnp.png)

As you can see our `PNP0C09` is found within the `Device (EC0)` meaning this is the device we want to hide from macOS(others may find `H_EC`, `ECDV`, etc, everyone's systems will be different). Now grab our SSDT-EC and uncomment the EC0 function(remove the `/*` and `*/` around it):

* [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl)
  * For Skylake and newer and all AMD systems
* [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl)
  * For Broadwell and older

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

But looking back at the screenshot above we notice something, our ACPI path is different: `PC00.LPC0` vs `PCI0.LPCB`. This is very important especially when you're dealing with Intel consumer vs Intel HEDT vs AMD, `PC00.LPC0` is common on Intel HEDT while `PCI0.SBRG` is common on AMD. And they even come with name variation such as  `EC0`, `H_EC`, `PGEC` and `ECDV`, so there can't be a one size fits all SSDT, **always verify your path and device. DO NOT ASSUME**.

* Finding the LowPinCount path:
  * Intel: Search `Name (_ADR, 0x001F0000)`
  * AMD: Search `Name (_ADR, 0x00140003)`
* Finding the PCI path:
  * Intel: Search `PNP0A08` (If multiple show up, use the first one)
  * AMD: Assume `PCI0`(most AMD DSDTs don't declare the PCI path directly)

And make sure to scroll to the bottom as the new Fake EC function also need the correct path to replace the old EC. **Do not rename `Device (EC)`**, this is our fake EC we're using for macOS to play with so leave `Device (EC)` alone. **Just change the path!**

> What happens if multiple `PNP0C09` show up

When this happens you need to figure out which is the main and which is not, it's fairly easy to figure out. Check each controller for the following properties:

* `_HID` (Hardware ID)
* `_CRS` (Current Resource Settings)
* `_GPE` (General Purpose Events)

Note if you have an STA Method as well, see below: [STA Edge Case](/Desktops/desktop-ec.md#sta-edge-case)

> What happens if no `PNP0C09` show up?

So what this means: EC faking is not mandatory for booting, instead only **recommended for proper USB power**.

So how do I make an SSDT without an EC? Well we'll only create a Fake EC for macOS to play with, this allows for AppleBusPowerController to load and handle our USB properly. To make the actual SSDT, its *almost* plug and play as no uncommenting needed. The main thing that needs to be changed:

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

## STA Edge Case

![Credit to rottenpants466](/images/Desktops/sta.png)

Do note that if your PNP0C09 device has a `Method (_STA` already you can skip down to "What happens if no `PNP0C09` show up?".
The reason for this is that the real EC is considered disabled already.

## Correcting USB Power

> Hey what about USBX? Do I need to do anything?

USBX is universal across all systems, it just creates a USBX device that forces USB power properties. This is crucial for fixing Mics, DACs, Webcams, Bluetooth Dongles and other high power draw devices. This is not mandatory to boot but should be added in post-install if not before. Note that USBX is only used on skylake+ systems, Broadwell and older can ignore and that USBX requires a patched EC to function correctly

## [Now you're ready to compile the SSDT!](/Manual/compile.md)
