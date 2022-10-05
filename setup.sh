if [ -d "app" ]
then
  echo "came here"
  launchctl unload app/changewallpaper.plist
  rm -rf app
fi

mkdir app

cp changewallpaper.sh app/changewallpaper.sh
cp changewallpaper.plist app/changewallpaper.plist

file_path=$(pwd)/app/changewallpaper.sh

sed -i'' -e "s=update-path=$file_path=g" app/changewallpaper.plist

chmod +x app/changewallpaper.sh

launchctl load app/changewallpaper.plist