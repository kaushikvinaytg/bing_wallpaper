#!/usr/bin/env ruby

require "net/http"
require "json"
require "fileutils"
require "digest"
require "securerandom"

dir = "#{ENV['HOME']}/.bing_wallpaper"

FileUtils.mkdir_p(dir)

file_name = Dir.entries(dir).select { |f| File.file?("#{dir}/#{f}") }.first

file_path = "#{dir}/#{file_name}" if file_name

URL = URI("https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-CA&uhd=1")

response = Net::HTTP.get(URL)
json_body = JSON.parse(response)

image_url = json_body["images"][0]["url"]
image_url.gsub!(/(1920|1080)/, {"1920" => "3024", "1080" => "1964"})

new_file_name = image_url.match(/\?id=([a-zA-Z0-9._-]+)&/)[1]
new_file_path = "#{dir}/#{new_file_name}"

file_path_to_set = file_path

if file_name != new_file_name
    Net::HTTP.start("www.bing.com") do |http|
        resp = http.get(image_url)
        open(new_file_path, "w+") do |file|
            file.write(resp.body)
        end
    end
    file_path_to_set = new_file_path
    File.delete(file_path) if file_name
end

`osascript -e 'tell application "Finder" to set desktop picture to POSIX file "#{file_path_to_set}"'`
