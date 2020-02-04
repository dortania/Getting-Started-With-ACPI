# Fixing NVRAM

This SSDT is required for all B360, B365, H310, H370, Z390 motherboards, it specifically brings back NVRAM support and requires very little configuration for the end user.

By default it uses `LPCB`, you can check by just searching for `Name (_ADR, 0x001F0000)`. This address is used for Low Pin Count devices(LPC) but the device name can vary between `LPCB`, `LBC` or `LBC0`. Just search each one in your config and which ever shows up is the one your system uses:

![](https://cdn.discordapp.com/attachments/456913818467958789/670148514197667840/Screen_Shot_2020-01-23_at_11.08.30_PM.png)
