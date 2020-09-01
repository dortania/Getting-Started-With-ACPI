# Cleanup

So you've made all your SSDTs but now there's one thing left: Adding them to Opencore

The 2 main locations:

* EFI/OC/ACPI (Only .**aml** files, reminder to [compile your SSDTs](/Manual/compile.md))
* config.plist -> ACPI -> Add

You can save yourself some work with the config.plist by running Cmd/Ctrl+R in ProperTree. **Reminder do not add your DSDT.aml to your EFI**

For those who do not yet have a config.plist, you'll want to next head back to your respective OpenCore guides and create the config.plist:

* [OpenCore Install guide](https://dortania.github.io/OpenCore-Install-Guide/)

Users of `FixHPET` will also need to merge oc_patches.plist into their config.plist

Steps to do this:

* Open both files,
* Delete the `ACPI -> Patch` section from config.plist
* Copy the `ACPI -> Patch` section from patches.plist
* Paste into where old patches were in config.plist
