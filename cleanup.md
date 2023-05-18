# Cleanup

Once you have created all your SSDTs, the final step is to add them to OpenCore.

The 2 main locations:

* EFI/OC/ACPI (Only .**aml** files, reminder to [compile your SSDTs](/Manual/compile.md))
* config.plist -> ACPI -> Add

You can save yourself some work with the config.plist by running Cmd/Ctrl+R in ProperTree. **Reminder do not add your DSDT.aml to your EFI**

If you don't have a config.plist yet, please go back to the OpenCore guide for your hardware and create one.

* [OpenCore Install guide](https://dortania.github.io/OpenCore-Install-Guide/)

Users of `FixHPET` will also need to merge oc_patches.plist into their config.plist

To achieve this, follow the steps below:

1. Open both files.
2. Remove the `ACPI -> Patch` section from the config.plist file.
3. Copy the `ACPI -> Patch` section from the patches.plist file.
4. Paste it into the location where the old patches were in the config.plist file.
