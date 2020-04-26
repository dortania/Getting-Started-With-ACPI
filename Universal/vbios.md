# Injecting a compatible VBIOS

**Work in progress**

So this is mainly needed for GPUs that are not natively supported out of the box due to their odd VBIOS, most commonly:

* XFX
* PowerColor
* HIS
* VisionTek

Instead, these GPUs need to be flashed to a model that works best in macOS which gernally being Sapphire. This is the brand that AMD uses for making their reference cards and what Apple bases a lot of their GPU logic off of. 

One small problem, flashing VBIOSes can be a bit dangerous and can even brick a card. So for us, we'll be injecting one via an SSDT that will only load in macOS. This means 2 things:

* Much easier to recover from, as you just remove the SSDT
* Allows you return the GPU easily incase of hardware issues

So to force a VBIOS onto the GPU, we need to find a couple things:

* Suitable VBIOS for the GPU
* ACPI Path of the GPU
* [SSDT-VBIOS]()


## Finding a suitable VBIOS

To find a suitable VBIOS, we'll be using [TechPowerUps Video BIOS Collection](https://www.techpowerup.com/vgabios/) which has a full database of basically all GPU VBIOSes. For this example, we'll be creating a VBIOS SSDT for the XFX RX 560 4GB. Now lets pull up the [Sapphire RX 560 4GB](https://www.techpowerup.com/vgabios/192320/sapphire-rx560-4096-170419) and download the VBIOS linked at the bottom:

```
Sapphire.RX560.4096.170419.rom
```
Now we have 1 small issue, our VBIOS must be padded to 65536 bytes(64KB). And our VBIOS is 262KB... *Shit*

[Insert magic software to shrink our VBIOS]














## Finding the ACPI Path of the GPU

To find the PCI path of a GPU is fairly simple, best way to find it is running Windows: 

* Open Device Manager
* Select Display Adapters, then right click your GPU and select Properties
* Under the Details Tab, search for "Location Paths"

![](/images/Desktops/amd.png)

![Credit to 1Revenger1 for the image](/images/Desktops/nvidia.png)


The second "ACPI" is what we care about:
```
ACPI(_SB_)#ACPI(PC02)#ACPI(BR2A)#ACPI(PEGP)#PCI(0000)#PCI(0000)
```

Now converting this to an ACPI path is quite simple, remove the `#ACPI` and `#PCI(0000)`:

```
`_SB_.PC02.BR2A.PEGP
```
And voila! We've found our ACPI path, now that we have everything we're ready to get cooking

## Making the SSDT

To start grab our [SSDT-VBIOS]() and open it up. Here there's a couple things to change:

```
External (_SB_.PCI0, DeviceObj)
External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
```
For our example, we'll change all mentions of :

* `PCI0` with `PC02`
* `PEG0` with `BR2A`

Hint: If your ACPI path is a bit shorter than the example, this is fine. Just make sure the ACPI paths are correct to your device.

Now that the ACPI pathing is correct, we can finally inject our VBIOS!!

So the part we want to change:

**VBIOS**:
```
"ATY,bin_image", 
Buffer (0x00010000)
{
    // Put your VBIOS here
},
```


## [Now you're ready to compile the SSDT!](/Manual/compile.md)

