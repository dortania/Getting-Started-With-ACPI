# Fixing Trackpads: Manual

* [Checking GPI0](#checking-gpio)
* [Edits to the sample SSDT](#edits-to-the-sample-ssdt)
* [Compiling the SSDT](#compiling-the-ssdt)
* [Wrapping up](#wrapping-up)


## Checking GPI0

The first thing which should be checked is the GPI0 device, which is required for VoodooI2C. The best way to check this is working is to use IORegistryViewer.

![]()

Here, we can see that VoodooI2C is attached to GPI0 so no edits are needed for GPI0 and you can skip to the next section.

If VoodooI2C isn't attached, then you may need to set `GPEN` or other variable to make sure GPI0 is enabled. In that case, you will need to find the GPI0 device in ACPI.

First open your decompiled DSDT you got from [Dumping the DSDT](/Manual/dump.md) and [Decompiling and Compiling](/Manual/compile.md) with either maciASL(if in macOS) or any other text editor if in Windows or Linux(VSCode has an [ACPI extension](https://marketplace.visualstudio.com/items?itemName=Thog.vscode-asl) that can also help).

Next search for `Device (GPI0)`. Should give you a result similar to this:

![](../../images/Laptops/trackpad-md/gpi0-2.png)

We can see that `_STA` method, which enables or disable the GPI0 device:

```
Method (_STA, 0, NotSerialized)
{
    If ((SBRG == Zero))
    {
        Return (Zero)
    }

    If ((GPEN == Zero))
    {
        Return (Zero)
    }

    Return (0x0F)
}

We want the value of _STA to be 0x0F, as 0x00 (Zero) would disable the device. This checks two values, `SBRG` and `GPEN`. If either `SBRG` or `GPEN` is equal to zero, then zero will be returned. Generally, `SBRG` should not be modified as it will be correct already, and modifying it can break the `GPI0` device. If `GPI0` needs to be enabled, only modify the `GPEN` value.

Here's some more examples:
![](../../images/Laptops/trackpad-md/gpi0.png)

What we care about from this is the `_STA` method:

```
Method (_STA, 0, NotSerialized)
{
    If ((GPHD == One))
    {
        Return (0x03)
    }

    Return (0x0F)
}
```

What we want is for this to always return `0x0F` when booting macOS, so we want to make an SSDT that will return `GPHD == Zero` in macOS.

**NOTE that you may have the other way around where GPHD needs to be set as `One` to return `0x0F`**. And your device name may also be different, don't throw random SSDTs in thinking it'll work

## Edits to the sample SSDT

Now that we have our ACPI path, lets grab our SSDT and get to work:

* [SSDT-GPI0.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-GPI0.dsl)

From the first example, we'll want to set GPEN to `One` to allow it to operate in macOS:

```
If (_OSI ("Darwin"))
{
    GPEN = One <- Proper variables
}
```

![](../../images/Laptops/trackpad-md/ssdt-after.png)

You will want to test the SSDT at this point by [compiling the SSDT!](/Manual/compile.md) and adding it to your config.plist. VoodooI2C should now be attached to the GPI0 device as shown at the top of the GPI0 section.

## Enabling Trackpad

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
