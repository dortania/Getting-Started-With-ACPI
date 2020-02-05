# Fixing System Clocks

**For Intel 300 series chipsets only**

What the [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) will do is force enable the Legacy RTC device in macOS, the reason we want to do this is that macOS currently does not support AWAC as a system clock. In some rare cases, there is no Legacy RTC device to force enable so we'll need to create a fake RTC device for macOS to play with using [SSDT-RTC0](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-RTC0.dsl)

To determine whether you need [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) or [SSDT-RTC0](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-RTC0.dsl):

* open your decompiled DSDT and search for `Device (AWAC)`
* If nothing shows then no need to continue and no need for this SSDT. 
* If you get a result then you have an `AWAC` system clock present, then continue with the next search for `STAS ==`:

![](https://i.imgur.com/uuUF857.png)

As you can see we found the `STAS ==` in our DSDT, this means we're able to force enable our Legacy RTC. In this case, [SSDT-AWAC](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-AWAC.dsl) will be used As-Is with no modifications required. Just need to compile.

For systems where no `STAS` shows up **but** you do have `AWAC`, you can use [SSDT-RTC0](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-RTC0.dsl) though you will need to check whether your DSDT uses `LPCB`, `LBC` or `LBC0`. 

By default it uses `LPCB`, you can check by just searching for `Name (_ADR, 0x001F0000)`. This address is used for Low Pin Count devices(LPC) but the device name can vary between `LPCB`, `LBC` or `LBC0`. Just search each one in your config and which ever shows up is the one your system uses:

![](https://cdn.discordapp.com/attachments/456913818467958789/670148514197667840/Screen_Shot_2020-01-23_at_11.08.30_PM.png)
