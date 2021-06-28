# Fixing IMEI: Manual

[[toc]]

## Finding the ACPI device

Finding the ACPI pathing is quite easy actually, first open your decompiled DSDT you got from [Dumping the DSDT](/Manual/dump.md) and [Decompiling and Compiling](/Manual/compile.md) with either MaciASL(if in macOS) or any other text editor if in Windows or Linux(VSCode has an [ACPI extension](https://marketplace.visualstudio.com/items?itemName=Thog.vscode-asl) that can also help).

Next, search for the following devices:

* `IMEI`
* `HECI`
* `MEI`

If none of the 3 show up, you'll need to create an SSDT-IMEI.

**If one of these 3 devices show up**, you do not need SSDT-IMEI! You can simply skip this page.

The rest of this page will however assume none of those 3 devices showed up.

## Compiling the SSDT

So there's actually no edits required to SSDT-IMEI, you can either grab the source code and compile yourself or use the prebuilt

* [Prebuilt SSDT-IMEI](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-IMEI-S.aml)

* [SSDT-IMEI's source code](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-IMEI.dsl)

With the SSDT done, you're now [ready to compile the SSDT!](/Manual/compile.md)

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
