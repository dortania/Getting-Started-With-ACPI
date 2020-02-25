# Compiling and decompiling ACPI Tables

## macOS

So compiling DSDTs and SSDTs are quite easy with macOS, all you need is [MaciASL](https://github.com/acidanthera/MaciASL/releases). To compile, just `File -> SaveAs -> ACPI Machine Language Binary(.AML)`, decompiling is just opening the file in MaciASL.

## Windows

Compiling and decompiling on windows is fairly simple though, you will need [iasl.exe](https://acpica.org/sites/acpica/files/iasl-win-20180105.zip) and Command Prompt:

```text
path/to/iasl.exe path/to/DSDT.aml
```

![](https://i.imgur.com/IY7HMof.png)

If compiled .aml file is provided, a decompiled .dsl file will be given and vice versa.

## Linux

Compiling and decompiling with Linux is just as simple, you will need a special copy of [iasl](http://amdosx.kellynet.nl/iasl.zip) and terminal:

```text
path/to/iasl path/to/DSDT.aml
```

If compiled .aml file is provided, a decompiled .dsl file will be given and vice versa.
