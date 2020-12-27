// Source: https://github.com/daliansky/OC-little
DefinitionBlock("", "SSDT", 2, "DRTNIA", "GPI0", 0)
{
    External(\GPEN, FieldUnitObj)
    External(\OSYS, IntObj)
    
    If (_OSI("Darwin"))
        \GPEN = One
        \OSYS = 0x07DF
    }
}
