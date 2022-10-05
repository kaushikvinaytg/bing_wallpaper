file_path=$(pwd)/changewallpaper.sh
backup_file_exists=0
test -f changewallpaper.plist-e && backup_file_exists=1

if [ $backup_file_exists == 1 ]
then
  launchctl unload changewallpaper.plist
  rm -rf changewallpaper.plist
  mv changewallpaper.plist-e changewallpaper.plist
fi

sed -i'' -e "s=update-path=$file_path=g" changewallpaper.plist
chmod +x changewallpaper.sh
launchctl load changewallpaper.plist