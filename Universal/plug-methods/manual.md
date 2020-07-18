# Fixing Power Management: Manual

* [Finding the ACPI path](#finding-the-acpi-path)
  * [DSDT](#DSDT)
  * [DeviceManager](#devicemanager)
* [Edits to the sample SSDT](#edits-to-the-sample-ssdt)
* [Compiling the SSDT](#compiling-the-ssdt)
* [Wrapping up](#wrapping-up)

## Finding the ACPI path

To find the ACPI pathing, you have 2 methods:

* [DSDT](#DSDT)
* [DeviceManager](#devicemanager)

### DSDT

CPU naming is fairly easy to figure out, first open your decompiled DSDT you got from [Dumping the DSDT](/Manual/dump.md) and [Decompiling and Compiling](/Manual/compile.md) with either maciASL(if in macOS) or any other text editor if in Windows or Linux(VSCode has an [ACPI extension](https://marketplace.visualstudio.com/items?itemName=Thog.vscode-asl) that can also help).

Next search for `Processor`. This should give you a result like this:

![](../../images/Universal/plug-md/processor.png)

As we can see, the first processor in our list is `SB.PR00`. This is what we'll be applying the `plugin-type=1` property too.

**X99 and X299 note**:

Due to the different DSDT structure of these systems, you'll need to to actually check in multiple places as the pathing isn't as obvious:

![](../../images/Universal/plug-md/processor-2.png)

If we then search for instances of `CP00` we find that its full ACPI pathing is `SB.SCK0.CP00`:

![](../../images/Universal/plug-md/cp00.png)

Now with the pathing, you can head here: [Edits to the sample SSDT](#edits-to-the-sample-ssdt)

##### DeviceManager

If you already have Windows installed on this machine, finding the CPU pathing is fairly easy.

Start by opening up Device Manager in Windows and looking for a device named `Processor`. Once found, click on it and select the `BIOS device Name` entry. You should get something like this:

![](../../images/Universal/plug-md/plug-bios.png)

From the above, we can see that our pathing is `PR.CPU0`. Pay close attention to the start as `PR` is important for creating the SSDT

**X99 and X299 note**:

Odd quirk of DeviceManager in Windows is that the Processor's order does not actually match the ACPI path, instead giving something like `SB.SCK0.CP10`:

![](../../images/Universal/plug-md/plug-x299.png)

When this happens, you can either:

* Look through and find the lowest value
* Assume the lowest(commonly being `PR00` or `CP00`)

So with the above X299 example, our CPU pathing would be `SB.SCK0.CP00`

Now with the pathing, you can head here: [Edits to the sample SSDT](#edits-to-the-sample-ssdt)

## Edits to the sample SSDT

Now that we have our ACPI path, lets grab our SSDT and get to work:

* [SSDT-PLUG.dsl](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl)

From the above SSDT, it's very likely your processor is already there. If so, you can delete all the other entries other than yours and the `Method PMPM` as this is what injects the `plugin-type=1` property into our system.

* **Reminder**: We only need to apply `plugin-type=1` to the first thread

For the below example, we'll be using the X299 example(`SB.SCK0.CP00`)

Original          |  Cleaned Up
:-------------------------:|:-------------------------:
![](../../images/Universal/plug-md/ssdt-mess.png)  |  ![](../../images/Universal/plug-md/ssdt-clean.png)

## Compiling the SSDT

 With the SSDT done, you're now [ready to compile the SSDT!](/Manual/compile.md)

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
