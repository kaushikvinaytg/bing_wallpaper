launch_agent_path="${HOME}/Library/LaunchAgents/changewallpaper.plist"

if [ -f $launch_agent_path ]
then
  launchctl unload $launch_agent_path
  rm -rf $launch_agent_path
fi

file_path=$(pwd)/changewallpaper.sh

sed -i'' -e "s=update-path=$file_path=g" changewallpaper.plist

mkdir -p ~/Library/LaunchAgents

mv changewallpaper.plist $launch_agent_path

mv changewallpaper.plist-e changewallpaper.plist

chmod +x changewallpaper.sh

launchctl load $launch_agent_path