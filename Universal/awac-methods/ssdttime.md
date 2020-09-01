# Fixing System Clocks (SSDT-AWAC/RTC0)

The second involves using SSDTTime which automates most of the process. See here on how to use it: [SSDTs: Easy Way](/ssdt-methods/ssdt-easy.md)

To get the SSDT-PMC, run the following:

* `7. Dump DSDT` then run `6. AWAC`

This will provide you with some files, the main one you care about is SSDT-AWAC.**aml**. or SSDT-RTC0.**aml**. The DSDT and .dsl are only left for referencing or verification.

The main things to note with this method:

* Doesn't really teach you anything
  * For most, this doesn't matter. But to some knowing what makes your hackintosh tick is part of the journey

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
