# Getting a copy of our DSDT

So to start, we'll need to get a copy of your DSDT from your firmware. There's a couple of options:

* [MaciASL](https://github.com/acidanthera/MaciASL/releases)
  * Open the app on the target machine(must already be running macOS) and the system's DSDT will show, then File -&gt; SaveAs `System DSDT`. Make sure the file format is ACPI Machine Language Binary(.AML), this will require the machine to be running macOS
  * Do note that all ACPI patches from clover/OpenCore will be applied to the DSDT
* [SSDTTime](https://github.com/corpnewt/SSDTTime)
  * Supports both Windows and Linux for DSDT dumping
  * Option 4 to dump
* [acpidump.exe](https://acpica.org/sites/acpica/files/iasl-win-20180105.zip)
  * In command prompt run `path/to/acpidump.exe -b -n DSDT -z`, this will dump your DSDT as a .dat file. Rename this to DSDT.aml
* F4 in Clover Boot menu
  * DSDT can be found in `EFI/CLOVER/ACPI/origin`, the folder **must** exist before dumping
* [`acpidump.efi`](https://github.com/khronokernel/Opencore-Vanilla-Desktop-Guide/tree/master/extra-files/acpidump.efi.zip)
  * Add this to `EFI/OC/Tools` and in your config under `Misc -> Tools` with the argument: `-b -n DSDT -z` and select this option in OpenCore's picker. Rename the DSDT.dat to DSDT.aml. Tool is provided by [acpica](https://github.com/acpica/acpica/tree/master/source/tools/acpidump)

If OpenCore is having issues running acpidump, you can call it from the shell with [OpenCoreShell](https://github.com/acidanthera/OpenCoreShell/releases)(reminder to add to both `EFI/OC/Tools` and in your config under `Misc -> Tools` ):

```text
shell> fs0: // replace with proper drive

fs0:\> dir // to verify this is the right directory

Directory of fs0:\

01/01/01 3:30p EFI

fs0:\> cd EFI\OC\Tools // note that it's with forward slashes

fs0:\EFI\OC\Tools> acpidump.efi -b -n DSDT -z
```
