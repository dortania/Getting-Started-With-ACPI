/*
 * Goal of this SSDT is to shut off the RHUB to force macOS into
 * manually building ports when the ACPI is screwed up
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "RhubOff", 0x00001000)
{
    External (_SB_.PCI0.XHC.RHUB, DeviceObj) // Full pathing to RHUB, change to yours


    Scope (_SB.PCI0.XHC.RHUB) // Full pathing to RHUB, change to yours
        {
            Method (_STA, 0, NotSerialized)
            {
               If (_OSI ("Darwin"))
                     {
                        Return (Zero) // This disables the device only in macOS
                     }
                     Else
                     {
                        Return (0x0F) // Re-enables it for Windows
                     }
           }                    
        }  
}

