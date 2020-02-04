# Fixing NVRAM

**This is required for all B360, B365, H310, H370, Z390 motherboards**

This SSDT brings back NVRAM support and uses the scope `PCI0.LPCB` to check what scope your system has, search your DSDT for `Name (_ADR, 0x001F0000)`. This address is used for Low Pin Count devices(LPC) but the device name can vary(quite rarely in reality, almost all consumer intel boards use `LPCB`)

![](https://cdn.discordapp.com/attachments/456913818467958789/670148514197667840/Screen_Shot_2020-01-23_at_11.08.30_PM.png)
