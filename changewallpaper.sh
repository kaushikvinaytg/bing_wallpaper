#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'fileutils'
require 'digest'

FileUtils.mkdir_p("#{ENV['HOME']}/.bing_wallpaper")

file_path = "#{ENV['HOME']}/.bing_wallpaper/wallpaper.jpg"

img_hash = Digest::MD5.hexdigest(File.read(file_path)) if File.exists?(file_path)

URL = URI("https://www.bing.com/HPImageArchive.aspx?format=js&idx=20&n=1&mkt=en-CA&uhd=1")

response = Net::HTTP.get(URL)
json_body = JSON.parse(response)

image_url = json_body["images"][0]["url"]
image_url.gsub!(/(1920|1080)/, {'1920' => '3024', '1080' => '1964'})

Net::HTTP.start("www.bing.com") do |http|
    resp = http.get(image_url)
    open(file_path, "w+") do |file|
        file.write(resp.body)
    end
end

img_hash_new = Digest::MD5.hexdigest(File.read(file_path))

if img_hash_new != img_hash
    `osascript -e 'tell application "Finder" to set desktop picture to POSIX file "#{file_path}"'`
end
