# Fixing Embedded Controller (Laptop)


To fix the ECs found in laptops, we'll be renaming them to look like the ones macOS expects. The reason for this is that many laptops break when you turn off their EC with an SSDT. So this is why we can't use the fancy SSDTTime to make a patch for us.

To find out what EC you have, open your decompiled DSDT and search for `PNP0C09`. This should give you a result like this:

![](https://i.imgur.com/lQ4kpb9.png)

As you can see our `PNP0C09` is found within the `Device (EC0)` meaning this is the device we want to rename.

> What happens if multiple `PNP0C09` show up

When this happens you need to figure out which is the main and which is not, it's fairly easy to figure out. Check each controller for the following properties:

* `_HID` (Hardware ID)
* `_CRS` (Current Resource Settings)
* `_GPE` (General Purpose Events)

Note that only the main EC needs renaming, if you only have one `PNP0C09` then it is automatically your main regardless of properties.


# Applying your EC patch

As you can see from the table below, we'll be renaming our EC listed in the DSDT. Do note you cannot just throw random renames without checking which is the main EC first, as **this can cause actual damage to your laptop.**

|Comment|Find\*\[HEX\]|Replace\[HEX\]|
|:-|:-|:-|
|change EC0 to EC|4543305f|45435f5f|
|change H\_EC to EC|485f4543|45435f5f|
|change ECDV to EC|45434456|45435f5f|
|change PGEC to EC|50474543|45435f5f|

## Inside your config:

| Comment | String | Change XXXX to EC |
| :--- | :--- | :--- |
| Enabled | String | YES |
| Count | Number | 0 |
| Limit | Number | 0 |
| Find | Data | xxxxxxxx |
| Replace | Data | xxxxxxxx |

![](https://cdn.discordapp.com/attachments/456913818467958789/668667268254793728/Screen_Shot_2020-01-19_at_9.04.50_PM.png)

