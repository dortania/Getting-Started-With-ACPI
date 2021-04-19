# Fixing System Clocks: Manual

* [Determining which SSDT you need](#determining-which-ssdt-you-need)
* [RTC0 Method](#rtc0-method)
  * [Finding the ACPI path](#finding-the-acpi-path)
  * [Edits to the sample SSDT](#edits-to-the-sample-ssdt)
* [Compiling the SSDT](#compiling-the-ssdt)
* [Wrapping up](#wrapping-up)

## Determining which SSDT you need

* **Note**: X99 and X299 see [here](../awac-methods/manual-hedt.md)

Finding which SSDT you need is quite easy actually, first open your decompiled DSDT you got from [Dumping the DSDT](/Manual/dump.md) and [Decompiling and Compiling](/Manual/compile.md) with either MaciASL(if in macOS) or any other text editor if in Windows or Linux(VSCode has an [ACPI extension](https://marketplace.visualstudio.com/items?itemName=Thog.vscode-asl) that can also help).

Next search for `ACPI000E`. You should get something similar:

![](../../images/Universal/awac-md/ACPI000E.png)

The above tells us a few things:

* We in fact do have an AWAC clock
  * If nothing shows up, you don't need to do anything for AWAC or RTC
* It can be easily disabled with STAS(if not, you can skip to here: [RTC0 Method](#rtc0-method))
  * `_STA` is the device status, with `Zero` meaning it won't show up
  
But to double check, next search for `PNP0B00`:

![](../../images/Universal/awac-md/PNP0B00.png)

And looks at that, we can in fact disable our AWAC and enable the RTC! If not skip to here: [RTC0 Method](#rtc0-method)

Now it's as simple as grabbing [SSDT-AWAC.dsl](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-AWAC-DISABLE.dsl) and [compile](#compiling-the-ssdt), no changes needed You can also use the below SSDT to the same effect:

* [SSDT-AWAC.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-AWAC.aml)

## RTC0 Method

This method is for those who either don't have a `PNP0B00` device to re-enable or have no easy way(via STAS variable).

### Finding the ACPI path

Assuming you've gotten your DSDT already opened from earlier, search for the following:

* Finding the LowPinCount path:
  * Search `Name (_ADR, 0x001F0000)`
* Finding the PCI path:
  * Search `PNP0A08` (If multiple show up, use the first one)

You should get something like the following show up:

LPC Pathing          |  PCI Pathing
:-------------------------:|:-------------------------:
![](../../images/Universal/nvram-md/lpc.png)  |  ![](../../images/Universal/nvram-md/pci0.png)

From the above, we can see we have both `PCI0` and `LPC`. Now we can head to the next stage

### Edits to the sample SSDT

Now that we have our ACPI path, lets grab our SSDT and get to work:

* [SSDT-RTC0.dsl](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-RTC0.dsl)

By default, this uses `PCI0.LPCB` for the pathing. you'll want to rename accordingly.

Following the example from above, we'll be renaming it to `PCI0.LPC`:

**Before**:

```
External (_SB_.PCI0.LPCB, DeviceObj) <- Rename this

Scope (_SB.PCI0.LPCB) <- Rename this
```

![](../../images/Universal/awac-md/ssdt-before.png)

Following the example pathing we found, the SSDT should look something like this:

**After**:

```
External (_SB_.PCI0.LPC, DeviceObj) <- Renamed

Scope (_SB.PCI0.LPC) <- Renamed
```

![](../../images/Universal/awac-md/ssdt-after.png)

### Compiling the SSDT

 With the SSDT done, you're now [ready to compile the SSDT!](/Manual/compile.md)

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
