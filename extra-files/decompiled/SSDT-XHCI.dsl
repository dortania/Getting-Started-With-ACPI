// Based off of leaked Intel Engineering SSDTs
DefinitionBlock ("", "SSDT", 0x02, "DRTNIA", "xh_nccrb", 0x0)
{
    
  // Declaring our RHUB device, this is what all USB ports will route through
  // Don't forget to rename XHC_ to what your USB controller's called(ex. XHCI)

  External(\_SB.PCI0.XHC_.RHUB, DeviceObj)

  // Declaring our individual USB ports
  // Don't forget to rename XHC_ to what your USB controller's called(ex. XHCI)

  External(\_SB.PCI0.XHC_.RHUB.HS01, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS02, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS03, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS04, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS05, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS06, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS07, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS08, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS09, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS10, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS11, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS12, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS13, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.HS14, DeviceObj)
  
  External(\_SB.PCI0.XHC_.RHUB.SS01, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS02, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS03, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS04, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS05, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS06, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS07, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS08, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS09, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.SS10, DeviceObj)
  
  // USBR ports, used for Storage Redirection
 
  External(\_SB.PCI0.XHC_.RHUB.USR1, DeviceObj)
  External(\_SB.PCI0.XHC_.RHUB.USR2, DeviceObj)



  Scope (\_SB.PCI0.XHC_.RHUB) {  // Verify XHC_ is the correct name

    //
    // Method for creating generic _PLD buffers
    // _PLD contains lots of data, but for purpose of internal validation we care only about
    // ports' visibility and pairing (this requires group position)
    // so these are the only 2 configurable parameters (User Visible, Group Position)
    //
    Method(GPLD, 2, Serialized) {
      Name(PCKG, Package() { Buffer(0x10) {} } )
      CreateField(DerefOf(Index(PCKG,0)), 0, 7, REV)
      Store(1,REV)
      CreateField(DerefOf(Index(PCKG,0)), 64, 1, VISI)
      Store(Arg0, VISI)
      CreateField(DerefOf(Index(PCKG,0)), 87, 8, GPOS)
      Store(Arg1, GPOS)


      return (PCKG)
    }//end GPLD

    //
    // Method for creating generic _UPC buffers
    // Similar to _PLD, for internal testing we only care about 1 parameter (port connectable)
    // Windows and Linux should correct the port-type themselves, and macOS will fix it via USB
    // mapping in post install
    //
    Method(GUPC, 1, Serialized) {
      Name(PCKG, Package(4) { 0, 0xFF, 0, 0 } )
      Store(Arg0,Index(PCKG,0))


      return (PCKG)
    }//end GUPC


  //
  // Below you'll find all the USB port scopes, these are used for defining what type
  // each is. Thankfully Windows will eat any garbage and still work fine, macOS is quite picky.
  // And now you can see why we need to rewirte the OEM's SSDT.
  // For us, we just want functional ports in macOS. So we won't be applying any special properties
  // to these ports besides the basics.
  //
  Scope (HS01) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,1)) }
  }

  Scope (HS02) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,2)) }
  }

  Scope (HS03) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,3)) }
  }

  Scope (HS04) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,4)) }
  }

  Scope (HS05) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,5)) }
  }

  Scope (HS06) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,6)) }
  }

  Scope (HS07) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,7)) }
  }

  Scope (HS08) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,8)) }
  }

  Scope (HS09) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,9)) }
  }

  Scope (HS10) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,10)) }
  }

  Scope (HS11) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,11)) }
  }

  Scope (HS12) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,12)) }
  }

  Scope (HS13) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,13)) }
  }

  Scope (HS14) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,14)) }
  }

  //
  // USBR Ports exist but aren't exposed to the end user directly
  // This is why we set the ports to 0
  //
  Scope (USR1) {
    Method(_UPC) { Return (GUPC(0)) }
    Method(_PLD) { Return (GPLD(0,0)) }
  }

  Scope (USR2) {
    Method(_UPC) { Return (GUPC(0)) }
    Method(_PLD) { Return (GPLD(0,0)) }
  }

  // USB 3.0 personalities
  Scope (SS01) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,1)) }
  }

  Scope (SS02) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,2)) }
  }

  Scope (SS03) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,3)) }
  }

  Scope (SS04) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,4)) }
  }

  Scope (SS05) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,5)) }
  }

  Scope (SS06) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,6)) }
  }

  Scope (SS07) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,7)) }
  }

  Scope (SS08) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,8)) }
  }

  Scope (SS09) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,9)) }
  }

  Scope (SS10) {
    Method(_UPC) { Return (GUPC(1)) }
    Method(_PLD) { Return (GPLD(1,10)) }
  }


  } //end scope RHUB

}//end of SSDT-XHCI