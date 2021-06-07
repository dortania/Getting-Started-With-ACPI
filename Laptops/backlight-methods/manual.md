# Fixing Backlight: Manual

* [Finding the ACPI path](#finding-the-acpi-path)
* [Edits to the sample SSDT](#edits-to-the-sample-ssdt)
* [Compiling the SSDT](#compiling-the-ssdt)
* [Wrapping up](#wrapping-up)

## Finding the ACPI path

### On MacOS
Unfortunately there is no guidance for this yet. Try on Linux or Windows.

### On Linux
These steps work on Ubuntu and may work on other distros. If not then try the procedure for Windows.  
Use the `lspci` command to get your display adapters PCI identification number.  
The output here will be different on your system!
```
# lspci -D
0000:00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
0000:00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
0000:00:01.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)
0000:00:02.0 VGA compatible controller: VMware SVGA II Adapter
0000:00:03.0 Ethernet controller: Intel Corporation 82540EM Gigabit Ethernet Controller (rev 02)
0000:00:04.0 System peripheral: InnoTek Systemberatung GmbH VirtualBox Guest Service
```
Search the output for an entry that looks like your display adapter. E.g: In this example we have `VGA compatible controller` with PCI number `0000:00:02.0`. The format of this number is `domain:bus:device:function`.  

Now use this command from a Terminal to find the ACPI path for your display adapter  
`# cat /sys/class/pci_bus/<domain:bus>/device/<domain:bus:device:function>/firmware_node/path`  

For example
```
# cat /sys/class/pci_bus/0000:00/device/0000:00:02.0/firmware_node/path
\_SB_.PCI0.GFX0  <-- The ACPI path
```
Further details [at this link.](https://unix.stackexchange.com/questions/653143/how-to-get-bios-device-name-from-linux-same-as-windows-device-manager-format)

### On Windows

Open DeviceManager, and head to the following:

```
Device Manager -> Display Adapters -> Properties -> Details > BIOS device name
```

* Note some GPU ACPI pathing may be hiding under "BIOS device name"

![Credit to 1Revenger1 for the image](../../images/Laptops/backlight-md/devicemanager.png)

From the above example, we can see our display is hooked up to `PCI0.GFX0`

## Edits to the sample SSDT

Now that we have our ACPI path, lets grab our SSDT and get to work:

* [SSDT-PNLF.dsl](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-PNLF.dsl)
* [SSDT-PNLFCFL.dsl](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-PNLFCFL.dsl)
  * For Coffee Lake and newer

By default, this uses `PCI0.GFX0` for the pathing. you'll want to rename accordingly. For this example, we'll assume your pathing is `PCI0.GPU0`:

**Before**:

```
External (_SB_.PCI0.GFX0, DeviceObj) <- Rename this

Scope (_SB.PCI0.GFX0) <- Rename this

Device(_SB.PCI0.GFX0.PNLF) <- Rename this
```

![](../../images/Laptops/backlight-md/ssdt-before.png)

Following the example pathing we found, the SSDT should look something like this:

**After**:

```
External (_SB_.PCI0.GPU0, DeviceObj) <- Renamed

Scope (_SB.PCI0.GPU0) <- Renamed

Device(_SB.PCI0.GPU0.PNLF) <- Renamed
```

![](../../images/Laptops/backlight-md/ssdt-after.png)

## Compiling the SSDT

 With the SSDT done, you're now [ready to compile the SSDT!](/Manual/compile.md)

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to wrap up:

* [**Cleanup**](/cleanup.md)
