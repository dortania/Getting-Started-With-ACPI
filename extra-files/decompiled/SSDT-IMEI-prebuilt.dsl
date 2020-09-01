/* Purpose of this SSDT is to:
 * 
 *   - Find references of devices named IMEI, HECI, MEI
 *   - If none are found, only then create a new IMEI device
 * 
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "SsdtIMEI", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.IMEI, DeviceObj)
    External (_SB_.PCI0.HECI, DeviceObj)
    External (_SB_.PCI0.MEI, DeviceObj)

    If ((!CondRefOf (\_SB.PCI0.IMEI) && !CondRefOf (\_SB.PCI0.HECI) && !CondRefOf (\_SB.PCI0.MEI)))
    {
        Scope (_SB.PCI0)
        {
            Device (IMEI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
            }
        }
    }
}

