A simple script to download the latest bing wallpaper and set it as wallpaper on MacOS.

In order to use it, convert the `setup.sh` to executeable file
```
chmod +x setup.sh
```
Then execute the `setup.sh` file 

```
./setup.sh
```

Once done, you can log out and log back into to check if it is working. It will also try to update every 12 hours. 

If you don't want to log out but still want to update the wallpaper after setup is complete, then you can manually run the script

```
./changewallpaper.sh
```

Command to remove all trace of this app

```
./remove.sh
```

Command to cleanup image folder except the current image

```
./cleanup.sh
```