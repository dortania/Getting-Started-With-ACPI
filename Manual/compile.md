# Compiling and decompiling ACPI Tables

See [Troubleshooting](/troubleshooting.md) if you have dumping/compiling errors

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

![](/images/Manual/compile-md/macos-compile.png)

## Windows

Compiling and decompiling on windows is fairly simple though, you will need [iasl.exe](https://acpica.org/downloads/binary-tools) and Command Prompt:

```text
path/to/iasl.exe path/to/DSDT.aml
```

![](/images/Manual/compile-md/windows-compile.png)

* If compiled .aml file is provided, a decompiled .dsl file will be given and vice versa.

## Linux

Compiling and decompiling with Linux is just as simple, you will need a copy of iasl. You can get it here ([iasl](http://amdosx.kellynet.nl/iasl.zip)) or through the `iasl` package in your package manager. iasl can be used as such:

```text
path/to/iasl path/to/DSDT.aml
```

* If compiled .aml file is provided, a decompiled .dsl file will be given and vice versa.
