# Compiling and decompiling ACPI Tables

See [General Troubleshooting](https://desktop.dortania.ml/troubleshooting/troubleshooting) if you have dumping/compiling errors

* [macOS Compiling and Decompiling](/Manual/compile.md#macos)
* [Windows Compiling and Decompiling](/Manual/compile.md#windows)
* [Linux Compiling and Decompiling](/Manual/compile.md#linux)

## macOS

So compiling DSDTs and SSDTs are quite easy with macOS, all you need is [MaciASL](https://github.com/acidanthera/MaciASL/releases). To compile, just `File -> SaveAs -> ACPI Machine Language Binary(.AML)`, decompiling is just opening the file in MaciASL.

For those who prefer the command line, grab [iasl-stable](https://github.com/acidanthera/MaciASL/blob/master/Dist/iasl-stable) and run the following:

```text
path/to/iasl.exe path/to/DSDT.aml
```
* If compiled .aml file is provided, a decompiled .dsl file will be given and vice versa.

![](https://cdn.discordapp.com/attachments/683011276938543134/695854856681816144/Screen_Shot_2020-04-03_at_10.38.18_PM.png)

## Windows

Compiling and decompiling on windows is fairly simple though, you will need [iasl.exe](https://acpica.org/sites/acpica/files/iasl-win-20180105.zip) and Command Prompt:

```text
path/to/iasl.exe path/to/DSDT.aml
```

![](https://i.imgur.com/IY7HMof.png)

* If compiled .aml file is provided, a decompiled .dsl file will be given and vice versa.

## Linux

Compiling and decompiling with Linux is just as simple, you will need a special copy of [iasl](http://amdosx.kellynet.nl/iasl.zip) and terminal:

```text
path/to/iasl path/to/DSDT.aml
```

* If compiled .aml file is provided, a decompiled .dsl file will be given and vice versa.