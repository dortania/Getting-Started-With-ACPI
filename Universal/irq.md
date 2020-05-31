# Fixing IRQ Conflicts (SSDT-HPET + OC_Patches.plist)

* [What this SSDT does](#what-this-ssdt-does)
* [Methods to make this SSDT](#methods-to-make-this-ssdt)
  * [Prebuilt](#prebuilts)
  * [SSDTTime](#ssdttime)
  * [Manual](#manual)
    * [Finding the ACPI path](#finding-the-acpi-path)
    * [Edits to the sample SSDT](#edits-to-the-sample-ssdt)
    * [Compiling the SSDT](#compiling-the-ssdt)

So you miss having those fancy hot-patches from Clover like FixIPIC, FixTMR, FixRTC, FixHPET, etc

Well 1 very small problem, figuring out IRQ patching is a massive headache. **I highly recommend you use SSDTTime**. So head over to [SSDT: Easy Way](/ssdt-easy.md) on how to make it.(use option `C` to omit conflicting legacy IRQs)
