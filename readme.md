A simple script to download the latest bing wallpaper and set it as wallpaper on MacOS.

In order to use it, convert the `changewallpaper.sh` to executeable file
```
chmod u+x changewallpaper.sh
```
Add `changewallpaper.plist` to the list of launchctl

```
launchctl load changewallpaper.plist
```

Once done, you can log out and log back into to check if it is working. It will also try to update every 12 hours. 
