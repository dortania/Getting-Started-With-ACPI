/*
 * Ensures unsed uncore bridges are disabled, otherwise X79 and X99
 * will kernel panic in Big Sur with IOPCIFamily. 
 * SSDT Taken from OpenCorePkg repo
 */

DefinitionBlock ("", "SSDT", 2, "DRTNIA", "UNC", 0x00000000)
{
    External (_SB.UNC0, DeviceObj)
    External (PRBM, IntObj)

    Scope (_SB.UNC0)
    {
        Method (_INI, 0, NotSerialized)
        {
             If (_OSI ("Darwin")) {
                 PRBM = 0
             }
        }
    }
}
