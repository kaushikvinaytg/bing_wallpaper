launch_agent_path="${HOME}/Library/LaunchAgents/changewallpaper.plist"

if [ -f $launch_agent_path ]
then
  launchctl unload $launch_agent_path
  rm -rf $launch_agent_path
fi

bing_folder_path="${HOME}/.bing_wallpaper"

rm -rf $bing_folder_path

app_path=`dirname $0`

rm -rf $app_path
