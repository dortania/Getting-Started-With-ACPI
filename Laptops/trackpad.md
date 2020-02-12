# Fixing Trackpads

This SSDT is used to force enable our GPIO for VoodooI2C to connect onto.

With most modern laptop DSDTs, there's a variable called `GPEN` or `GPHD` which are used for setting the status of the GPIO device. For us, we want to enable the device.

## Finding our GPIO

So first things we need to do is find out what variable is used to enable our GPIO device, lets open up our decompiled SSDT and search for `Device (GPIO)`. Should give you a desult similar to this:

![](https://media.discordapp.net/attachments/456913818467958789/677279455525208096/Screen_Shot_2020-02-12_at_3.25.27_PM.png?width=1674&height=1256)


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

Once you found the variable and what it should be set to, grab a copy of [SSDT-GPI0.dsl](https://github.com/khronokernel/Getting-Started-With-ACPI/blob/master/extra-files/SSDT-GPI0.dsl) and make the required edits. Then clean up with compiling it


## More examples:

![](https://media.discordapp.net/attachments/456913818467958789/677283983322775572/Screen_Shot_2020-02-12_at_3.34.26_PM.png?width=1674&height=1704)

With this example, we can see that we need both `SBRG` and `GPEN` to return `One`. If only one is present, it'll create some issues so in our SSDT we'll want to have both of them return `One`:
```
DefinitionBlock("", "SSDT", 2, "ACDT", "GPI0", 0)
{
    External(GPEN, FieldUnitObj)
    External(SBRG, FieldUnitObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPEN = One
            SBRG = One
        }
    }
}
```
