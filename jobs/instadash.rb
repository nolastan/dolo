require 'instagram'

# Instagram Client ID from http://instagram.com/developer
Instagram.configure do |config|
  config.client_id = 'e218a3db1c9b49efa1365b17fd059d15'
end

# Latitude, Longitude for location
instadash_location_lat = '37.7600989'
instadash_location_long = '-122.4268572'

SCHEDULER.every '10m', :first_in => 0 do |job|
  photos = Instagram.location_recent_media(4704582)
  if photos
    photos.map! do |photo|
      { photo: "#{photo.images.low_resolution.url}" }
    end    
  end
  send_event('instadash', photos: photos)
end
