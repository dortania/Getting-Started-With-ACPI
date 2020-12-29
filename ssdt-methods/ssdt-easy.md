# SSDTs: The easy way

So here we'll be using a super simple tool made by CorpNewt: [SSDTTime](https://github.com/corpnewt/SSDTTime)

What this tool does is, it dumps your DSDT from your firmware, and then creates SSDTs based off your DSDT. **This must be done on the target machine running either Windows or Linux**

## So what **CAN'T** SSDTTime do

* **SSDT-PNLF**:
  * Need to be configured to your system
* **SSDT-GPI0**:
  * Need to be configured to your system
* **USBX SSDT**:
  * This is included on sample SSDTs but SSDTTime only makes the SSDT-EC part, Skylake and newer users can grab a pre-built here: [SSDT-USBX.aml](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/SSDT-USBX.aml)
* **IMEI SSDT**:
  * If you have either a Sandy bridge CPU with 7 series motherboard or Ivy Bridge with 6 series motherboard, you'll need to either use the prebuilt or manually create it.
* **RTC0 RANGE SSDT**:
  If you have X99 or X299, you'll need to configure it to your system

For users who don't have all the options available to them in SSDTTime, you can follow the "SSDTs: The long way" section. You can still use SSDTTime for SSDTs it does support.

## Running SSDTTime

Run the `SSDTTime.bat` file as Admin on the target machine and you should see something like this:

![](../images/ssdt-easy-md/ssdttime.png)

What are all these options?:

* `1. FixHPET    - Patch out IRQ Conflicts`
  * IRQ patching, mainly needed for X79, X99 and laptop users(use option `C` to omit conflicting legacy IRQs)
* `2. FakeEC     - OS-aware Fake EC`
  * This is the SSDT-EC, required for Catalina users
* `3. FakeEC Laptop  - OS-aware Fake EC`
  * This is the SSDT-EC, but the laptop version only Builds Fake EC and leaves the existing EC devices untouched, again required for Catalina users
* `4. PluginType - Sets plugin-type = 1 on First ProcessorObj`
  * This is the SSDT-PLUG, for Intel only
* `5. PMC - Sets Power Management controller status`
  * This is the SSDT-PMC, for Intel true 300+ series only, this device is missing from ACPI in recent boards and helps to bring back NVRAM support.
* `6. AWAC - Context-Aware AWAC Disable and RTC Fake`
  * This is the SSDT-AWAC/RTC0, its purpose  is to fix the system clocks found on newer hardware
* `7. USB Reset     - Reset USB controllers to allow hardware mapping`
  * This is SSDT-RHUB, used for resetting USB ports in macOS for Asus's Z490 motherboards
* `8. Dump DSDT  - Automatically dump the system DSDT`
  * Dumps your DSDT from your firmware

What we want to do is select option `8. Dump DSDT` first, then select the appropriate option(s) for your system.

> What about USBX?

For Skylake and newer plus AMD, you can grab a pre-built file here: [SSDT-USBX.aml](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/SSDT-USBX.aml). This file is plug and play and requires no device configuration, **do not use on Broadwell and older**.

**Troubleshooting note**: See [General Troubleshooting](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/troubleshooting.html) if you're having issues running SSDTTime

## Adding to OpenCore

Don't forget that SSDTs need to be added to OpenCore, reminder that .aml is complied, .dsl is code. **Add only the .aml file**:

* EFI/OC/ACPI
* config.plist -> ACPI -> Add

Reminder that Cmd/Ctrl+R with ProperTree pointed at your OC folder will add all your SSDTs, kexts and .efi drivers to the config for you. **Do not add your DSDT to OpenCore, its already in your firmware**. If you are unsure what this is referring to, go back to the OpenCore guide and select your config based of the architecture of your CPU.

For those who do not yet have a config.plist, you'll want to next head back to your respective OpenCore guides and create the config.plist:

* [OpenCore Install guide](https://dortania.github.io/OpenCore-Install-Guide/)

Users of `FixHPET` will also need to merge oc_patches.plist into their config.plist

Steps to do this:

* Open both files,
* Delete the `ACPI -> Patch` section from config.plist
* Copy the `ACPI -> Patch` section from patches.plist
* Paste into where old patches were in config.plist
