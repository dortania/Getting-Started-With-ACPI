# Disabling laptop dGPUs (SSDT-dGPU-Off/NoHybGfx)

* [What this SSDT does](#what-this-ssdt-does)
* [Methods to make this SSDT](#methods-to-make-this-ssdt)
  * [Prebuilt](#prebuilts)
  * [SSDTTime](#ssdttime)
  * [Manual](#manual)
    * [Finding the ACPI path](#finding-the-acpi-path)
    * [Edits to the sample SSDT](#edits-to-the-sample-ssdt)
    * [Compiling the SSDT](#compiling-the-ssdt)

So with laptops, we can hide the dGPU from macOS with the little boot-arg called `-wegnoegpu` from WhateverGreen. But one small problem, the dGPU is still pulling power draining your battery slowly. We'll be going over 2 methods for disabling the dGPU in a laptop:

* [Optimus Method](/Laptops/laptop-disable.md#optimus-method)
* [Bumblebee Method](/Laptops/laptop-disable.md#bumblebee-method)

Note that this is not needed for install, but recommended for post-install

## Optimus Method

How this works is that we call the `.off` method found on Optimus GPUs, this is the expected way to power off a GPU but some may find their dGPU will power back up later on. Mainly seen in Lenovo's, the Optimus method should work for most users:

To start, grab [SSDT-dGPU-Off.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-dGPU-Off.dsl.zip)

Next we need to get on Windows, and head to the following:

```
Device Manager -> Display Adapters -> dGPU -> Properties -> Details > BIOS device name
```

* Note some GPUs may be hiding under "BIOS device name"

This should provided you with an ACPI path for your dGPU, most commonly:

* Nvidia dGPU: `\_SB.PCI0.PEG0.PEGP`
* AMD dGPU: `\_SB.PCI0.PEGP.DGFX`

![Credit to 1Revenger1 for the image](../images/Desktops/nvidia.png)

Now with that, we'll need to change the ACPI path in the SSDT. Main sections:

```
External(_SB.PCI0.PEG0.PEGP._OFF, MethodObj)
```

```
If (CondRefOf(\_SB.PCI0.PEG0.PEGP._OFF)) { \_SB.PCI0.PEG0.PEGP._OFF() }
```

Once adapted to your config, head to the compile section

* For those with sleep issues, you can refer to the original [Rehabman thread](https://www.tonymacx86.com/threads/guide-disabling-discrete-graphics-in-dual-gpu-laptops.163772/)

## Bumblebee Method

With some machines, the simple `.off` call won't keep the card off properly, that's where the Bumblebee method comes in. This SSDT will actually send the dGPU into D3 state being the lowest power state a device can support. Credit to Mameo for the original adaptation.

To start, grab [SSDT-NoHybGfx.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-NoHybGfx.dsl.zip)

Next we need to get on Windows, and head to the following:

```
Device Manager -> Display Adapters -> dGPU -> Properties -> Details > BIOS device name
```

This should provided you with an ACPI path for your dGPU, most commonly:

* Nvidia dGPU: `\_SB.PCI0.PEG0.PEGP`
* AMD dGPU: `\_SB.PCI0.PEGP.DGFX`

Now with that, we'll need to change the ACPI path in the SSDT. Main sections:

```
External (_SB_.PCI0.PEG0.PEGP._DSM, MethodObj)    // dGPU ACPI Path
External (_SB_.PCI0.PEG0.PEGP._PS3, MethodObj)    // dGPU ACPI Path
```

```
If ((CondRefOf (\_SB.PCI0.PEG0.PEGP._DSM) && CondRefOf (\_SB.PCI0.PEG0.PEGP._PS3)))
```

``` text
 // Card Off Request
 \_SB.PCI0.PEG0.PEGP._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
```

```
 // Card Off
\_SB.PCI0.PEG0.PEGP._PS3 ()
```

Once adapted to your config, head to the compile section

## [Now you're ready to compile the SSDT!](/Manual/compile.md)
