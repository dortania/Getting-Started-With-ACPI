# Disabling laptop dGPUs

So with laptops, we can hide the dGPU from macOS with the little boot-arg called `-wegnoegpu` from WhateverGreen. But one small problem, the dGPU is still pulling power draining your battery slowly. We'll be going over 2 methods for disabling the dGPU in a laptop:

* [Optimus Method](/Laptops/laptop-disable.md#optimus-method)
* [Bumblebee Method](/Laptops/laptop-disable.md#bumblebee-method)

## Optimus Method

How this works is that we call the `.off` method found on Optimus GPUs, this is the expected way to power off a GPU but some may find their dGPU will power back up later on. Mainly seen in Lenovo's, the Optimus method should work for most users:

To start, grab [SSDT-dGPU-Off.dsl](https://github.com/khronokernel/Getting-Started-With-ACPI/blob/master/extra-files/SSDT-dGPU-Off.dsl.zip)


Next we need to get on Windows, and head to the following:

```text
Device Manager -> Display Adapters -> dGPU -> Properties -> Details > BIOS device name
```

This should provided you with an ACPI path for your dGPU, most commonly:

* Nvidia dGPU: `\_SB.PCI0.PEG0.PEGP`
* AMD dGPU: `\_SB.PCI0.PEGP.DGFX`

Now with that, we'll need to change the ACPI path in the SSDT. Main sections:

```text
External(_SB.PCI0.PEG0.PEGP._OFF, MethodObj) // ACPI Path of dGPU
```text

```text
If (CondRefOf(\_SB.PCI0.PEG0.PEGP._OFF)) { \_SB.PCI0.PEG0.PEGP._OFF() }
```

Once adapted to your config, head to the compile section


## Bumblebee Method

With some machines, the simple `.off` call won't keep the card off properly, that's where the Bumblebee method comes in. This SSDT will actually send the dGPU into D3 state being the lowest power state a device can support. Creit to Mameo for the original adaptation

To start, grab [SSDT-NoHybGfx.dsl](https://github.com/khronokernel/Getting-Started-With-ACPI/blob/master/extra-files/SSDT-NoHybGfx.dsl.zip)

Next we need to get on Windows, and head to the following:

```text
Device Manager -> Display Adapters -> dGPU -> Properties -> Details > BIOS device name
```

This should provided you with an ACPI path for your dGPU, most commonly:

* Nvidia dGPU: `\_SB.PCI0.PEG0.PEGP`
* AMD dGPU: `\_SB.PCI0.PEGP.DGFX`

Now with that, we'll need to change the ACPI path in the SSDT. Main sections:

```text
External (_SB_.PCI0.PEG0.PEGP._DSM, MethodObj)    // dGPU ACPI Path
External (_SB_.PCI0.PEG0.PEGP._PS3, MethodObj)    // dGPU ACPI Path
```

```text
If ((CondRefOf (\_SB.PCI0.PEG0.PEGP._DSM) && CondRefOf (\_SB.PCI0.PEG0.PEGP._PS3)))
                {
                    // Card Off Request
                    \_SB.PCI0.PEG0.PEGP._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x03                         
                        })
                    // Card Off
                    \_SB.PCI0.PEG0.PEGP._PS3 () 
                }
```

Once adapted to your config, head to the compile section

## [Now you're ready to compile the SSDT!](/Manual/compile.md)