# Troubleshooting

* [Fixing SSDTTime: `Could not locate or download iasl!`](/troubleshooting.md#fixing-ssdttime-could-not-locate-or-download-iasl)
* [Can't run `acpidump.efi`](/troubleshooting.md#cant-run-acpidumpefi-from-opencore)
* [iASL warning, # unresolved](/troubleshooting.md#iasl-warning--unresolved)
* [Decompiling Error](/troubleshooting.md#decompiling-error)
* [Invalid character (0x3D), expecting ASL keyword or name](/troubleshooting.md#invalid-character-0x3d-expecting-asl-keyword-or-name)
* [Syntax error, unexpected PARSEOP_ONE, expecting '('](/troubleshooting.md#syntax-error-unexpected-parseopone-expecting-)

## Fixing SSDTTime: `Could not locate or download iasl!`

This is usually due to an outdated version of Python, try either updating Python or adding iasl to the scripts folder for SSDTTime:

* [iasl macOS version](https://bitbucket.org/RehabMan/acpica/downloads/iasl.zip)
* [iasl Windows version](https://acpica.org/downloads/binary-tools)
* [iasl Linux version](http://amdosx.kellynet.nl/iasl.zip)

## Can't run `acpidump.efi` from OpenCore

Grab [OpenShell](https://github.com/acidanthera/OpenCorePkg/releases) and add it to EFI/OC/Tools and config.plist -> Misc -> Tools.

Next, call upon the OpenCore shell and enter the following:

```
shell> fs0: //replace with proper drive

fs0:\> dir //to verify this is the correct directory

  Directory of fs0:\

   01/01/01 3:30p  EFI

fs0:\> cd EFI\OC\Tools //note that its with forward slashes

fs0:\EFI\OC\Tools> acpidump.efi -b -n DSDT -z
```

## iASL warning, # unresolved

If you try to decompile your DSDT and get an error similar to this:

```
iASL Warning: There were 19 external control methods found during disassembly, but only 0 were resolved (19 unresolved)
```

This happens when one ACPI table requires the rest for proper referencing, it does not accept the creation of DSDTs as we're only using it for creating a select few SSDTs. For those who are worried, you can run the following:

```
iasl * [insert all ACPI files here]
```

## Decompiling Error

![](./images/troubleshooting-md/decompile-error.png)

```
Loading Acpi table from file iASLAwjHrs.aml
Acpi table [DSDT] successfully installed and loaded
Pass 1 parse of [DSDT]
```

If you encounter an error on DSDTs due to unsupported methods in MaciASL, the simplest solution is to uninstall MaciASL and download it from Acidanthera's repository. Here's the link: [MaciASL](https://github.com/acidanthera/MaciASL/releases)

## Invalid character (0x3D), expecting ASL keyword or name

![](./images/troubleshooting-md/invalid-parse.png)

Like the above error, you're running an outdated copy of MaciASL. Make sure you're using the latest from Acidanthera's repo: [MaciASL](https://github.com/acidanthera/MaciASL/releases)

## Syntax error, unexpected PARSEOP_ONE, expecting '('

![](./images/troubleshooting-md/invalid-parse.png)

Like the above 2 errors, you're running an outdated copy of MaciASL. Make sure you're using the latest from Acidanthera's repo: [MaciASL](https://github.com/acidanthera/MaciASL/releases)
