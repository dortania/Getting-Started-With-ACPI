# Fixing Embedded Controller (Laptop)

## You'll want to go to [SSDT-EC under the Universal tab](/Universal/desktop-ec.md) for the new SSDT-EC page.

To fix the ECs found in laptops, we'll be renaming them to look like the ones macOS expects. The reason for this is that many laptops break when you turn off their EC with an SSDT. So this is why we can't use the fancy SSDTTime to make a patch for us.

To find out what EC you have, open your decompiled DSDT and search for `PNP0C09`. This should give you a result like this:

![](/images/Laptops/laptop-ec-md/dsdt-pnp.png)

As you can see our `PNP0C09` is found within the `Device (EC0)` meaning this is the device we want to rename.

> What happens if multiple `PNP0C09` show up

When this happens you need to figure out which is the main and which is not, it's fairly easy to figure out. Check each controller for the following properties:

* `_HID` (Hardware ID)
* `_CRS` (Current Resource Settings)
* `_GPE` (General Purpose Events)

Note that only the main EC needs renaming, if you only have one `PNP0C09` then it is automatically your main regardless of properties.

> What if my main `PNP0C09` device is already called `Device (EC)`?

Mainly relevant for Lenovo and a few other OEMs, when this happens that means that your Embedded Controller is ready to use in macOS! Do make sure that this `Device (EC)` is actually your main EC and not a secondary one.

**And please verify that the DSDT hasn't already been patched by Clover or OpenCore**, please dump it without booting either of them to be sure or triple check that there aren't any EC renames in your config already

![](/images/Laptops/laptop-ec-md/ec.png)

For those having issues, you can also check `Device Manager -> Embedded Controller -> BIOS device Name`. Widows will only report the main EC so will save you some headache on that

# Applying your EC patch

As you can see from the table below, we'll be renaming our EC listed in the DSDT. Do note you cannot just throw random renames without checking which is the main EC first, as **this can cause actual damage to your laptop.**

|Comment|Find\*\[HEX\]|Replace\[HEX\]|
|:-|:-|:-|
|change EC0 to EC|4543305f|45435f5f|
|change H\_EC to EC|485f4543|45435f5f|
|change ECDV to EC|45434456|45435f5f|
|change PGEC to EC|50474543|45435f5f|

## Inside your config

| Comment | String | Change XXXX to EC |
| :--- | :--- | :--- |
| Enabled | String | YES |
| Count | Number | 0 |
| Limit | Number | 0 |
| Find | Data | xxxxxxxx |
| Replace | Data | xxxxxxxx |

![](/images/Laptops/laptop-ec-md/config.png)
