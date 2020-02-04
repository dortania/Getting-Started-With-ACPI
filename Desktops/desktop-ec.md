
# Fixing Embedded Controller (Desktop)

This one's fairly easy to figure out, open your decompiled DSDT and search for `PNP0C09`. This should give you a result like this:

![](https://i.imgur.com/lQ4kpb9.png)

As you can see our `PNP0C09` is found within the `Device (EC0)` meaning this is the device we want to hide from macOS(others may find ). Now grab our SSDT-EC and uncomment the EC0 function(remove the `/*` and `*/` around it):

* [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC-USBX.dsl)
  * For Skylake+ and all AMD systems
* [SSDT-EC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-EC.dsl)
  * For Haswell and older

```text
/* <- REMOVE THIS
External (_SB_.PCI0.LPCB.EC0, DeviceObj)

   Scope (\_SB.PCI0.LPCB.EC0)
   {   
      Method (_STA, 0, NotSerialized) // _STA: Status
      {
         If (_OSI ("Darwin"))
         {
            Return (0)
         }
         Else
      {
      Return (0x0F)
     }
  }
}
*/ <- REMOVE THIS
```

But looking back at the screenshot above we notice something, our ACPI path is different: `PC00.LPC0` vs `PCI0.LPCB`. This is very important especially when you're dealing with Intel consumer vs Intel HEDT and AMD, `PC00.LPC0` is common on Intel HEDT while `PCI0.SBRG` is common on AMD. And they even come with name variation such as  `EC0`, `H_EC`, `PGEC` and `ECDV`, so there can't be a one size fits all SSDT, **always verify your path and device**. 

And make sure to scroll to the bottom as the new Fake EC function also need the correct path to replace the old EC. **Do not rename the EC device itself**, this is our fake EC we're using for macOS to play with. Just change the path!

> What happens if multiple `PNP0C09` show up

When this happens you need to figure out which is the main and which is not, it's fairly easy to figure out. Check each controller for the following properties:

* `_HID`
* `_CRS`
* `_GPE`

> What happens if no `PNP0C09` show up?

This means your SSDT can be *almost* complied, the main thing to watch for is whether your DSDT uses `PCI0.LPCB` or not. The reason being is that we have a FakeEC at the bottom of our SSDT that needs to connect properly into our DSDT. Gernally AMD uses `SBRG` while Intel HEDT use `LPC0`, **verify which show up in your DSDT**.

You can check by just searching for `Name (_ADR, 0x001F0000)`(this only works for Intel, AMD users should assume `SBRG`). This address is used for Low Pin Count devices(LPC) but the device name can vary between `LPCB`, `LBC` or `LBC0`. Just search each one in your config and which ever shows up is the one your system uses

![](https://cdn.discordapp.com/attachments/456913818467958789/670148514197667840/Screen_Shot_2020-01-23_at_11.08.30_PM.png)


Once you find out, change `PCI0.LPCB` to your correct path:

```text
Scope (\_SB.PCI0.LPCB)
{
    Device (EC)
    {
        Name (_HID, "ACID0001")  // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}
```


> Hey what about USBX? Do I need to do anything?

USBX is universal across all systems, it just creates a USBX device that forces USB power properties. This is crucial for fixing Mics, DACs, Webcams, Bluetooth Dongles and other high power draw devices. This is not mandatory to boot but should be added in post-install if not before. Note that USBX is only used on skylake+ systems, Broadwell and older can ignore and that USBX requires a patched EC to function correctly

For those who want a deeper dive into the EC issue: [What's new in macOS Catalina](https://www.reddit.com/r/hackintosh/comments/den28t/whats_new_in_macos_catalina/)
