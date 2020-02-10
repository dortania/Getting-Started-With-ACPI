# Fixing System Clocks

**For Intel 300 series chipsets only**

So on newer Intel 300 series motherboards, manufactueres started pushing for a new type of system clock: **AWAC**( **A** **W**eird **A**ss **C**lock). One small problem, macOS doesn't know what the hell an AWAC clock is instead only familiar with the legacy **RTC**(**R**eal **T**ime **C**lock). So we need to figure out how to bring back the old clock, thats where `SSDT-AWAC` and `SSDT-RTC0` come in:

* [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl)
   * Disables AWAC and enables RTC
   * In your DSDT, there's a varaible called `STAS` used for holding either a `One` or `Zero` to determine which clock to use(`One` for RTC and `Zero` for AWAC)
   
* [SSDT-RTC0](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-RTC0.dsl)
   * Used for creating a fake RTC device for macOS to play with
   * In very rare circumstances, some DSDTs may not have a legacy RTC to fall back on. When this happens, we'll want to create a fake device to make macOS happy


Note: AWAC actually stands for ACPI Wake Alarm Counter/Clock for those curious, though I'll forever know it as A Weird Ass Clock ;p

## Determining which SSDT you need

To determine whether you need [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) or [SSDT-RTC0](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-RTC0.dsl):

* open your decompiled DSDT and search for `Device (AWAC)`
* If nothing shows then no need to continue and no need for this SSDT as you have no AWAC. Otherwise, continue on!
* If you get a result then you have an `AWAC` system clock present, then continue with the next search for `STAS ==`:

![](https://i.imgur.com/uuUF857.png)

As you can see we found the `STAS ==` in our DSDT, this means we're able to force enable our Legacy RTC. In this case, [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) will be used As-Is with no modifications required. Just need to compile.

For systems where no `STAS` shows up **but** you do have `AWAC`, you can use [SSDT-RTC0](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-RTC0.dsl) though you will need to check the naming of LPC in your DSDT

By default the SSDT uses `LPCB`, you can check what your system uses by just searching for `Name (_ADR, 0x001F0000)`. This address is used for Low Pin Count devices(LPC) but the device name can vary between `LPCB`, `LBC` or `LBC0`:

![](https://cdn.discordapp.com/attachments/456913818467958789/675169950108876852/Screen_Shot_2020-02-06_at_7.43.24_PM.png)


## [Now you're ready to compile the SSDT!](/Manual/compile.md)
