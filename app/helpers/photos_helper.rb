require 'flickraw'

module PhotosHelper
  class FlickRaw::Response
    def build_img_url
      "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}_q.jpg"
    end
  end
end
