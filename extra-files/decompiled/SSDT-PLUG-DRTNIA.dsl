/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200214 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/mykolagrymalyuk/Documents/GitHub/Getting-Started-With-ACPI/extra-files/compiled/SSDT-PLUG-DRTNIA.aml, Thu May 28 18:59:18 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000002B5 (693)
 *     Revision         0x02
 *     Checksum         0xDD
 *     OEM ID           "DRTNIA"
 *     OEM Table ID     "CpuPlug"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "CpuPlug", 0x00003000)
{
    External (_PR_.C000, ProcessorObj)
    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.P000, ProcessorObj)
    External (_PR_.PR00, ProcessorObj)
    External (_SB_.CPU0, ProcessorObj)
    External (_SB_.PC00.LPC0, DeviceObj)
    External (_SB_.PC00.LPC0.EC0_, DeviceObj)
    External (_SB_.PC00.LPC0.EC__, DeviceObj)
    External (_SB_.PC00.LPC0.ECDV, DeviceObj)
    External (_SB_.PC00.LPC0.H_EC, DeviceObj)
    External (_SB_.PC00.LPC0.PGEC, DeviceObj)
    External (_SB_.PCI0.LPC0, DeviceObj)
    External (_SB_.PCI0.LPC0.EC0_, DeviceObj)
    External (_SB_.PCI0.LPC0.EC__, DeviceObj)
    External (_SB_.PCI0.LPC0.ECDV, DeviceObj)
    External (_SB_.PCI0.LPC0.H_EC, DeviceObj)
    External (_SB_.PCI0.LPC0.PGEC, DeviceObj)
    External (_SB_.PCI0.LPC_, DeviceObj)
    External (_SB_.PCI0.LPC_.EC0_, DeviceObj)
    External (_SB_.PCI0.LPC_.EC__, DeviceObj)
    External (_SB_.PCI0.LPC_.ECDV, DeviceObj)
    External (_SB_.PCI0.LPC_.H_EC, DeviceObj)
    External (_SB_.PCI0.LPC_.PGEC, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.ECDV, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.PGEC, DeviceObj)
    External (_SB_.PCI0.PX40, DeviceObj)
    External (_SB_.PCI0.PX40.EC0_, DeviceObj)
    External (_SB_.PCI0.PX40.EC__, DeviceObj)
    External (_SB_.PCI0.PX40.ECDV, DeviceObj)
    External (_SB_.PCI0.PX40.H_EC, DeviceObj)
    External (_SB_.PCI0.PX40.PGEC, DeviceObj)
    External (_SB_.PCI0.SBRG, DeviceObj)
    External (_SB_.PCI0.SBRG.EC0_, DeviceObj)
    External (_SB_.PCI0.SBRG.EC__, DeviceObj)
    External (_SB_.PCI0.SBRG.ECDV, DeviceObj)
    External (_SB_.PCI0.SBRG.H_EC, DeviceObj)
    External (_SB_.PCI0.SBRG.PGEC, DeviceObj)
    External (_SB_.PR00, ProcessorObj)
    External (_SB_.SCK0.CP00, ProcessorObj)
    External (_SB_.SCK0.PR00, ProcessorObj)

    Method (PMPM, 4, NotSerialized)
    {
        If ((Arg2 == Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                             // .
            })
        }

        Return (Package (0x02)
        {
            "plugin-type", 
            One
        })
    }

    If (CondRefOf (\_SB.CPU0))
    {
        If ((ObjectType (\_SB.CPU0) == 0x0C))
        {
            Scope (\_SB.CPU0)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_PR.CPU0))
    {
        If ((ObjectType (\_PR.CPU0) == 0x0C))
        {
            Scope (\_PR.CPU0)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_SB.PR00))
    {
        If ((ObjectType (\_SB.PR00) == 0x0C))
        {
            Scope (\_SB.PR00)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_PR.C000))
    {
        If ((ObjectType (\_PR.C000) == 0x0C))
        {
            Scope (\_PR.C000)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_PR.P000))
    {
        If ((ObjectType (\_PR.P000) == 0x0C))
        {
            Scope (\_PR.P000)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_PR.PR00))
    {
        If ((ObjectType (\_PR.PR00) == 0x0C))
        {
            Scope (\_PR.PR00)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_SB.SCK0.CP00))
    {
        If ((ObjectType (\_SB.SCK0.CP00) == 0x0C))
        {
            Scope (\_SB.SCK0.CP00)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_SB.SCK0.PR00))
    {
        If ((ObjectType (\_SB.SCK0.PR00) == 0x0C))
        {
            Scope (\_SB.SCK0.PR00)
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }
}

