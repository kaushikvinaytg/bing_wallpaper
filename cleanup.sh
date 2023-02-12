GLOBIGNORE=`osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)'`

bing_folder_path="${HOME}/.bing_wallpaper/*"

rm -v $bing_folder_path

unset GLOBIGNORE