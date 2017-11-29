require 'flickraw'

module PhotosHelper
  class FlickRaw::Response
    def build_img_url
      "https://farm#{self.farm}.staticflickr.com/#{self.server}/#{self.id}_#{self.secret}_q.jpg"
    end
  end
end
