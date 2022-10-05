#!/usr/bin/env ruby

require "net/http"
require "json"
require "fileutils"

dir = "#{ENV['HOME']}/.bing_wallpaper"

FileUtils.mkdir_p(dir)

file_path = `osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)'`

file_name = File.basename(file_path)&.strip

URL = URI("https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-CA&uhd=1")

response = Net::HTTP.get(URL)
json_body = JSON.parse(response)

image_url = json_body["images"][0]["url"]
image_url.gsub!(/(1920|1080)/, {"1920" => "3024", "1080" => "1964"})

new_file_name = image_url.match(/\?id=([a-zA-Z0-9._-]+)&/)[1]

new_file_path = "#{dir}/#{new_file_name}"

if file_name != new_file_name
    Net::HTTP.start("www.bing.com") do |http|
        resp = http.get(image_url)
        open(new_file_path, "w+") do |file|
            file.write(resp.body)
        end
    end
    `osascript -e 'tell application "Finder" to set desktop picture to POSIX file "#{new_file_path}"'`
end

