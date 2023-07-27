# Patching DMAR Table: Manual

What we will be doing is removing the Reserved Memory Regions to allow this table to load without conflicts in macOS - which is necessary for Intel I225 based Ethernet Controllers, Aquantia Ethernet Controllers, and some WiFi devices.

## Preparation

First we need to gather files necessary to patch our DMAR Table.  If you've used the `SysReport` Quirk that is included with the Debug version of OpenCore, then you should have a `DMAR-1.aml` file residing inside your EFI Partition `SysReport/ACPI` folder.  This is your un-modified DMAR Table that we will be manipulating going forward so make sure to store a copy somewhere on your PC for easy access.

## Manipulation

### Creating our Customized DMAR Table

Easiest way to manipulate the DMAR table is to use the GUI program MaciASL, this is a macOS only program, which can be acquired [here](https://github.com/acidanthera/MaciASL).  It is time to create our customized version of our original DMAR table with the Reserved Memory Regions removed.  So to start, we will open the copy of our `DMAR-1.aml` file we extracted from our system.

![](../../images/Universal/dmar-md/dmar-example-rmr.png) | ![](../../images/Universal/dmar-md/dmar-example-normr.png)
:-------------------------------:|:------------------:
Example of a DMAR Table with Reserved Memory Regions. | Example of a DMAR Table without Reserved Memory Regions

If your DMAR Table looks like Example #2 which has no Reserved Memory Regions, you can skip this guide and merely disable `DisableIoMapper` in your `config.plist`, remove the  and make sure VT-d is enabled in your BIOS.

Now if your DMAR Table looks like Example #1, please continue below.

With our `DMAR-1.aml` file open, it is time to begin patching it, and do not worry, this is pretty easy to do.  All we are doing is highlighting every section that is labelled `Reserved Memory Region` or Subtable Type of `0001` just like in the example below.

![](../../images/Universal/dmar-md/dmar-rmr-selected.png)

### Dropping DMAR Table

To get started, you will need to prepare your `config.plist` for deleting or "dropping" the DMAR table.  This is done in the `ACPI->Delete` section.

::: tip Delete Code

| Comment        | String  | Drop DMAR Table |
| :------        | :------ | :-------------- |
| All            | Boolean | YES             |
| Enabled        | Boolean | YES             |
| TableSignature | Data    | 444D4152        |

::: warning

You must still conform to the OpenCore's `config.plist` schema, so make sure to consult with the OpenCore Configuration document for all required fields that must be present within `ACPI->Delete` and fill them in with their failsafe values.

:::
