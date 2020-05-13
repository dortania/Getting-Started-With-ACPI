/*
 * What this mess of an SSDT tries to accomplish is this:
 *  - Disable valid ECs, they will have the following properties:
 *      - _HID
 *      - _CRS
 *      - _GPE
 *  - Check for _STA to avoid conflicts
 *  - Create a new fake EC to let macOS play with
 *  - Create a USBX device for Skylake and newer
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "SsdtEC", 0x00001000)
{
    // AMD Trash and glorious Core2 hardware
    
    External (_SB_.PCI0.SBRG, DeviceObj)
    External (_SB_.PCI0.SBRG.EC, DeviceObj)
    External (_SB_.PCI0.SBRG.EC0, DeviceObj)
    External (_SB_.PCI0.SBRG.H_EC, DeviceObj)
    External (_SB_.PCI0.SBRG.ECDV, DeviceObj)
    External (_SB_.PCI0.SBRG.PGEC, DeviceObj)

    // Consumer Desktop
    
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.ECDV, DeviceObj)
    External (_SB_.PCI0.LPCB.PGEC, DeviceObj)
    
    // Other laptop variations(I'm sure Lenovo uses it in some weird desktop)
    
    External (_SB_.PCI0.LPC, DeviceObj)
    External (_SB_.PCI0.LPC.EC, DeviceObj)
    External (_SB_.PCI0.LPC.EC0, DeviceObj)
    External (_SB_.PCI0.LPC.H_EC, DeviceObj)
    External (_SB_.PCI0.LPC.ECDV, DeviceObj)
    External (_SB_.PCI0.LPC.PGEC, DeviceObj)
    
    // Cursed X79 and X99
    
    External (_SB_.PCI0.LPC0, DeviceObj)
    External (_SB_.PCI0.LPC0.EC, DeviceObj)
    External (_SB_.PCI0.LPC0.EC0, DeviceObj)
    External (_SB_.PCI0.LPC0.H_EC, DeviceObj)
    External (_SB_.PCI0.LPC0.ECDV, DeviceObj)
    External (_SB_.PCI0.LPC0.PGEC, DeviceObj)
    
    // Even more cursed X299
    
    External (_SB_.PC00.LPC0, DeviceObj)
    External (_SB_.PC00.LPC0.EC, DeviceObj)
    External (_SB_.PC00.LPC0.EC0, DeviceObj)
    External (_SB_.PC00.LPC0.H_EC, DeviceObj)
    External (_SB_.PC00.LPC0.ECDV, DeviceObj)
    External (_SB_.PC00.LPC0.PGEC, DeviceObj)

    
    
    
    // Let the AMD Trash being(and glorious Core2)
    If ((CondRefOf (\_SB.PCI0.SBRG.EC)))
    {
        If ((((CondRefOf (\_SB.PCI0.SBRG.EC._HID) && CondRefOf (\_SB.PCI0.SBRG.EC._CRS)) && CondRefOf (\_SB.PCI0.SBRG.EC._GPE
            )) && !CondRefOf (\_SB.PCI0.SBRG.EC._STA)))
        {
            Scope (\_SB.PCI0.SBRG.EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.SBRG.EC0)))
    {
        If ((((CondRefOf (\_SB.PCI0.SBRG.EC0._HID) && CondRefOf (\_SB.PCI0.SBRG.EC0._CRS)) && CondRefOf (\_SB.PCI0.SBRG.EC0._GPE
            )) && !CondRefOf (\_SB.PCI0.SBRG.EC0._STA)))
        {
            Scope (\_SB.PCI0.SBRG.EC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.SBRG.H_EC)))
    {
        If ((((CondRefOf (\_SB.PCI0.SBRG.H_EC._HID) && CondRefOf (\_SB.PCI0.SBRG.H_EC._CRS)) && CondRefOf (\_SB.PCI0.SBRG.H_EC._GPE
            )) && !CondRefOf (\_SB.PCI0.SBRG.H_EC._STA)))
        {
            Scope (\_SB.PCI0.SBRG.H_EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.SBRG.ECDV)))
    {
        If ((((CondRefOf (\_SB.PCI0.SBRG.ECDV._HID) && CondRefOf (\_SB.PCI0.SBRG.ECDV._CRS)) && CondRefOf (\_SB.PCI0.SBRG.ECDV._GPE
            )) && !CondRefOf (\_SB.PCI0.SBRG.ECDV._STA)))
        {
            Scope (\_SB.PCI0.SBRG.ECDV)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.SBRG.PGEC)))
    {
        If (((((CondRefOf (\_SB.PCI0.SBRG.PGEC._HID)) && CondRefOf (
            \_SB.PCI0.SBRG.PGEC._CRS)) && CondRefOf (\_SB.PCI0.SBRG.PGEC._GPE)) && !CondRefOf (\_SB.PCI0.SBRG.PGEC._STA)))
        {
            Scope (\_SB.PCI0.SBRG.PGEC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    // Now we go to consumer
    
    If ((CondRefOf (\_SB.PCI0.LPCB.EC)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPCB.EC._HID) && CondRefOf (\_SB.PCI0.LPCB.EC._CRS)) && CondRefOf (\_SB.PCI0.LPCB.EC._GPE
            )) && !CondRefOf (\_SB.PCI0.LPCB.EC._STA)))
        {
            Scope (\_SB.PCI0.LPCB.EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPCB.EC0)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPCB.EC0._HID) && CondRefOf (\_SB.PCI0.LPCB.EC0._CRS)) && CondRefOf (\_SB.PCI0.LPCB.EC0._GPE
            )) && !CondRefOf (\_SB.PCI0.LPCB.EC0._STA)))
        {
            Scope (\_SB.PCI0.LPCB.EC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPCB.H_EC)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPCB.H_EC._HID) && CondRefOf (\_SB.PCI0.LPCB.H_EC._CRS)) && CondRefOf (\_SB.PCI0.LPCB.H_EC._GPE
            )) && !CondRefOf (\_SB.PCI0.LPCB.H_EC._STA)))
        {
            Scope (\_SB.PCI0.LPCB.H_EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPCB.ECDV)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPCB.ECDV._HID) && CondRefOf (\_SB.PCI0.LPCB.ECDV._CRS)) && CondRefOf (\_SB.PCI0.LPCB.ECDV._GPE
            )) && !CondRefOf (\_SB.PCI0.LPCB.ECDV._STA)))
        {
            Scope (\_SB.PCI0.LPCB.ECDV)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPCB.PGEC)))
    {
        If (((((CondRefOf (\_SB.PCI0.LPCB.PGEC._HID)) && CondRefOf (
            \_SB.PCI0.LPCB.PGEC._CRS)) && CondRefOf (\_SB.PCI0.LPCB.PGEC._GPE)) && !CondRefOf (\_SB.PCI0.LPCB.PGEC._STA)))
        {
            Scope (\_SB.PCI0.LPCB.PGEC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }    
    // Laptop trash
    
    If ((CondRefOf (\_SB.PCI0.LPC.EC)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPC.EC._HID) && CondRefOf (\_SB.PCI0.LPC.EC._CRS)) && CondRefOf (\_SB.PCI0.LPC.EC._GPE
            )) && !CondRefOf (\_SB.PCI0.LPC.EC._STA)))
        {
            Scope (\_SB.PCI0.LPC.EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPC.EC0)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPC.EC0._HID) && CondRefOf (\_SB.PCI0.LPC.EC0._CRS)) && CondRefOf (\_SB.PCI0.LPC.EC0._GPE
            )) && !CondRefOf (\_SB.PCI0.LPC.EC0._STA)))
        {
            Scope (\_SB.PCI0.LPC.EC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPC.H_EC)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPC.H_EC._HID) && CondRefOf (\_SB.PCI0.LPC.H_EC._CRS)) && CondRefOf (\_SB.PCI0.LPC.H_EC._GPE
            )) && !CondRefOf (\_SB.PCI0.LPC.H_EC._STA)))
        {
            Scope (\_SB.PCI0.LPC.H_EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPC.ECDV)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPC.ECDV._HID) && CondRefOf (\_SB.PCI0.LPC.ECDV._CRS)) && CondRefOf (\_SB.PCI0.LPC.ECDV._GPE
            )) && !CondRefOf (\_SB.PCI0.LPC.ECDV._STA)))
        {
            Scope (\_SB.PCI0.LPC.ECDV)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPC.PGEC)))
    {
        If (((((CondRefOf (\_SB.PCI0.LPC.PGEC._HID)) && CondRefOf (
            \_SB.PCI0.LPC.PGEC._CRS)) && CondRefOf (\_SB.PCI0.LPC.PGEC._GPE)) && !CondRefOf (\_SB.PCI0.LPC.PGEC._STA)))
        {
            Scope (\_SB.PCI0.LPC.PGEC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }
    
    // X79 and X99 trash
    
    If ((CondRefOf (\_SB.PCI0.LPC0.EC)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPC0.EC._HID) && CondRefOf (\_SB.PCI0.LPC0.EC._CRS)) && CondRefOf (\_SB.PCI0.LPC0.EC._GPE
            )) && !CondRefOf (\_SB.PCI0.LPC0.EC._STA)))
        {
            Scope (\_SB.PCI0.LPC0.EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPC0.EC0)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPC0.EC0._HID) && CondRefOf (\_SB.PCI0.LPC0.EC0._CRS)) && CondRefOf (\_SB.PCI0.LPC0.EC0._GPE
            )) && !CondRefOf (\_SB.PCI0.LPC0.EC0._STA)))
        {
            Scope (\_SB.PCI0.LPC0.EC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPC0.H_EC)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPC0.H_EC._HID) && CondRefOf (\_SB.PCI0.LPC0.H_EC._CRS)) && CondRefOf (\_SB.PCI0.LPC0.H_EC._GPE
            )) && !CondRefOf (\_SB.PCI0.LPC0.H_EC._STA)))
        {
            Scope (\_SB.PCI0.LPC0.H_EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPC0.ECDV)))
    {
        If ((((CondRefOf (\_SB.PCI0.LPC0.ECDV._HID) && CondRefOf (\_SB.PCI0.LPC0.ECDV._CRS)) && CondRefOf (\_SB.PCI0.LPC0.ECDV._GPE
            )) && !CondRefOf (\_SB.PCI0.LPC0.ECDV._STA)))
        {
            Scope (\_SB.PCI0.LPC0.ECDV)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PCI0.LPC0.PGEC)))
    {
        If (((((CondRefOf (\_SB.PCI0.LPC0.PGEC._HID)) && CondRefOf (
            \_SB.PCI0.LPC0.PGEC._CRS)) && CondRefOf (\_SB.PCI0.LPC0.PGEC._GPE)) && !CondRefOf (\_SB.PCI0.LPC0.PGEC._STA)))
        {
            Scope (\_SB.PCI0.LPC0.PGEC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }
        
    // Cursed X299
    
    If ((CondRefOf (\_SB.PC00.LPC0.EC)))
    {
        If ((((CondRefOf (\_SB.PC00.LPC0.EC._HID) && CondRefOf (\_SB.PC00.LPC0.EC._CRS)) && CondRefOf (\_SB.PC00.LPC0.EC._GPE
            )) && !CondRefOf (\_SB.PC00.LPC0.EC._STA)))
        {
            Scope (\_SB.PC00.LPC0.EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PC00.LPC0.EC0)))
    {
        If ((((CondRefOf (\_SB.PC00.LPC0.EC0._HID) && CondRefOf (\_SB.PC00.LPC0.EC0._CRS)) && CondRefOf (\_SB.PC00.LPC0.EC0._GPE
            )) && !CondRefOf (\_SB.PC00.LPC0.EC0._STA)))
        {
            Scope (\_SB.PC00.LPC0.EC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PC00.LPC0.H_EC)))
    {
        If ((((CondRefOf (\_SB.PC00.LPC0.H_EC._HID) && CondRefOf (\_SB.PC00.LPC0.H_EC._CRS)) && CondRefOf (\_SB.PC00.LPC0.H_EC._GPE
            )) && !CondRefOf (\_SB.PC00.LPC0.H_EC._STA)))
        {
            Scope (\_SB.PC00.LPC0.H_EC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PC00.LPC0.ECDV)))
    {
        If ((((CondRefOf (\_SB.PC00.LPC0.ECDV._HID) && CondRefOf (\_SB.PC00.LPC0.ECDV._CRS)) && CondRefOf (\_SB.PC00.LPC0.ECDV._GPE
            )) && !CondRefOf (\_SB.PC00.LPC0.ECDV._STA)))
        {
            Scope (\_SB.PC00.LPC0.ECDV)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If ((CondRefOf (\_SB.PC00.LPC0.PGEC)))
    {
        If (((((CondRefOf (\_SB.PC00.LPC0.PGEC._HID)) && CondRefOf (
            \_SB.PC00.LPC0.PGEC._CRS)) && CondRefOf (\_SB.PC00.LPC0.PGEC._GPE)) && !CondRefOf (\_SB.PC00.LPC0.PGEC._STA)))
        {
            Scope (\_SB.PC00.LPC0.PGEC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }
    
    // And finally, create our fake EC and USBX
    Scope (\_SB)
    {
        Device (EC) // The EC is supposed to be located after the LPC device but doesn't actually matter since this is just a dummy device
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply",
                    0x13EC,
                    "kUSBSleepPortCurrentLimit",
                    0x0834,
                    "kUSBWakePowerSupply",
                    0x13EC,
                    "kUSBWakePortCurrentLimit",
                    0x0834
                })
            }
        }
    }
}
