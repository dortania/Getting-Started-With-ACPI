/*
 * Goal of this SSDT is to shut off the RHUb to force macOS into
 * manually building ports when the ACPI is screwed up
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "RhubOff", 0x00001000)
{
    // Handle 99% of XHCI naming variations
    
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (_SB_.PCI0.XHCI.RHUB, DeviceObj)
    External (_SB_.PCI0.XHC1.RHUB, DeviceObj)


    If (CondRefOf (\_SB.PCI0.XHC_.RHUB))
    {
        Scope (_SB.PCI0.XHC_.RHUB)
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
    
    If (CondRefOf (\_SB.PCI0.XHCI.RHUB))
    {
        Scope (_SB.PCI0.XHCI.RHUB)
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
    
    If (CondRefOf (\_SB.PCI0.XHC1.RHUB))
    {
        Scope (_SB.PCI0.XHC1.RHUB)
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
    
}

