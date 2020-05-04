# Fixing Power Management

## Easy Way

With CPU Power Management, it's a simple as taking [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) provided by Acidanthera and compiling it yourself.  You can find a prebuilt of the file here: [SSDT-PLUG-DRTNIA.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/SSDT-PLUG-DRTNIA.aml)

* Note: This file has a bit of extra bloat as it includes checks for all common CPU names, if you wish to clean this up, either remove unused names or follow the guide below.

## Long Way(For those who want to learn)

CPU naming is fairly easy to figure out as well, open your decompiled DSDT and search for `Processor`. This should give you a result like this:

![](/images/Universal/plug-md/processor.png)

As we can see, the first processor in our list is `PR00`. This is what we'll be applying the `plugin-type=1` property too. Now grab [SSDT-PLUG](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/SSDT-PLUG.dsl.zip) and replace the default `CPU0` with our `PR00`. There's a couple things to note:

* There's 2 mentions of CPU0 to change
* The `PR` path may need to be changed, in our example we can see that our `PR00` has `SB` in front.

So in our final example, we'd have `_SB_.PR00` and `\_SB.PR00`

* **Note**: If you're having issues, see the [SSDT-PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) provided by Acidanthera for example on what other ACPI paths may look like.

There are also some edge cases with `Processor`, specifically on HEDT series like X79, X99 and X299. This edge case is that the ACPI path is much longer and not so obvious:

![](/images/Universal/plug-md/processor-2.png)

If we then search for instances of `CP00` we find that it's ACPI path is `SB.SCK0.CP00`:

![](/images/Universal/plug-md/cp00.png)

So for this X299 board, we'd change `\_PR.CPU0` with `\_SB.SCK0.CP00` and `External (_PR_.CPU0, ProcessorObj)` with `External (_SB_.SCK0.CP00, ProcessorObj)`

```text
External (_PR_.CPU0, ProcessorObj) <- Rename this

Scope (\_PR.CPU0) <- Rename this
{
    Method (DTGP, 5, NotSerialized)
    {
       ...
    }
```

![](/images/Universal/plug-md/plug-bios.png)
![](/images/Universal/plug-md/plug-x299.png)

For those having issues, you can also check `Device Manager -> CPU -> BIOS device Name`

**Note**: X299 may report CP10 or higher for the CPU, when this happens use CP00 instead. This issue is due to weird numeration on Windows' side

## [Now you're ready to compile the SSDT!](/Manual/compile.md)
