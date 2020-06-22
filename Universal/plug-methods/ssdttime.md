# Fixing Power Management: SSDTTime

The second involves using SSDTTime which automates most of the process. See here on how to use it: [SSDTs: Easy Way](/ssdt-methods/ssdt-easy.md)

To get the SSDT-PLUG, run the following:

* `4. Dump DSDT` then run `3. PluginType`

This will provide you with some files, the main one you care about is SSDT-PLUG**.aml**. The DSDT and .dsl are only left for referencing or verification.

The main things to note with this method:

* Doesn't work on HEDT and server hardware(ie. X99 and X299)
  * While the majority following this guide are likely on consumer hardware, those with fancier hardware will need to either use the [Prebuilt](#prebuilts) or [Manual](#manual) method
* Doesn't really teach you anything
  * For most, this doesn't matter. But to some knowing what makes your hackintosh tick is part of the journey

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
