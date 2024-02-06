## THIS SCRIPT IS SHARED WITHOUT ANY WARRANTY

### Registry-Backup *tweaked by TOVOT*

this script was designed to backup Windows Registy

also allow to restore your backup (just in case), the script have 2 premaded path:

`$sourceDir = "$env:USERPROFILE\Desktop"`

`$destDir = "$env:USERPROFILE\Desktop"`

You just need to place the script in your Desktop

or modify the script with Notepad (or any other editor) with the source and destination you want use

`$sourceDir` meaning the source of registry backup (where the registry files of backup are placed by the script)

`$destDir` meaning the final destination of backup files

> [!IMPORTANT]
> if you setup the script using 2 different folders for *source* and *destination* remember to uncomment `Move-Item -Path $sourceDir\*.reg -Destination $destDir` removing `#` from the start of the line, so the script can move the backup in a different selected folder, if not uncommented the script just search in `$destDir` (which is enough if source and destination is the same folder)
>
> also if you use OneDrive need change `"$env:USERPROFILE\Desktop"` to `"$env:USERPROFILE\OneDrive\Desktop"` or the script doesent work
