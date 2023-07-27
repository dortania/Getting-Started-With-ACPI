# Patching DMAR Table: Manual

## Preparation

First we need to gather files necessary to patch our DMAR Table.  If you've used the `SysReport` Quirk that is included with the Debug version of OpenCore, then you should have a DMAR-1.aml file residing inside your EFI Partition `SysReport/ACPI` folder.  This is your un-modified DMAR Table that we will be manipulating going forward so make sure to store a copy somewhere on your PC for easy access.

## Manipulation

Easiest way to manipulate the DMAR table is to use the GUI program MaciASL, this is a macOS only program.  To get started, you will need to prepare your `config.plist` for deleting or "dropping" the DMAR table.

::: details Delete Code

| Comment        | String  | Drop DMAR Table |
| :------        | :------ | :-------------- |
| All            | Boolean | YES             |
| Enabled        | Boolean | YES             |
| TableSignature | Data    | 444D4152        |

::: warning

You must still conform to the OpenCore's `config.plist` schema, so make sure to consult with the OpenCore Configuration document for all fields that must be apart of `ACPI->Delete` and fill them in with their failsafe values.

:::
