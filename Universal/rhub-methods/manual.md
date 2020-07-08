# Fixing USB: Manual

* [Finding the ACPI table](#finding-the-acpi-table)
* [Edits to the sample SSDT](#edits-to-the-ssdt)
* [Compiling the SSDT](#compiling-the-ssdt)
* [Wrapping up](#wrapping-up)

## Finding the ACPI table

So unlike the previous SSDT creations, we're not going to be working with the DSDT, instead we're gonna be looking through the entire ACPI dump and trying to find the bad table. 

So to get these tables:

* Run DEBUG version of OpenCore with `SysReport` enables
* **or** running [acpidump.exe](https://acpica.org/downloads/binary-tools) in Windows
  * note that the files dumped will need to be renamed from `.dat` to `.aml`
  
  
Once you've done that, you should have a full folder similar to the below:

![](/images/Universal/rhub-md/acpi-dump.png)


As you can see, we've got a bunch of ACPI tables that we need to decompile first. To make things a bit simpler, we only need to decompile the SSDTs. The rest of the tables are unneeded.

To run a mass decompile:

```
/path/to/iasl/ /path/to/SSDT-1 /path/to/SSDT-2 ...
```

![](/images/Universal/rhub-md/iasl.png)

And so on... Don't worry about any compiler warning's, we won't be recompiling most of those files.

Once done, you should get something like the following:

![](/images/Universal/rhub-md/acpi-dump-decompiled.png)

Now comes the fun part: Finding our bad SSDT

As per Intel's engineering sample SSDTs, the OEM table ID will generally start with `xh_` with some string after it(in Intel's example, they use `"xh_nccrb"`):

![](/images/Universal/rhub-md/sample-driver.png)

So we'll want to search for `xh_` inside the `DefinitionBlock` of the SSDTs, luckily they will **only** be in the SSDTs so makes searching far shorter. 

For our example, we'll be using an Asus ROG MAXIMUS XII EXTREME as our example. For a quick search, we've found our SSDT with `xh_` is SSDT-6! Specifically `"xh_cmsd4"`
 
![](/images/Universal/rhub-md/asus-stock.png)


## Edits to the SSDT

Now comes the fun part, writing our own custom SSDT. For this we'll first want to grab a modified copy of Intel's engineering SSDT:

* [SSDT-XHCI.dsl](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-XHCI.dsl.zip)

Now once you open it up, you should get the following:

![]()









## Compiling the SSDT

 With the SSDT done, you're now [ready to compile the SSDT!](/Manual/compile.md)

## Wrapping up

Once you're done making your SSDT, either head to the next page to finish the rest of the SSDTs or head here if you're ready to warp up:

* [**Cleanup**](/cleanup.md)
