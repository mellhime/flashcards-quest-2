class PhotosController < ApplicationController
  include PhotosHelper

  def search
    @results = []

    if params[:search_input].to_s.strip.empty?
      flash.now[:alert] = "Please enter some text to search for..."
    else
      FlickRaw.api_key = Rails.application.secrets.flickr_api_key
      FlickRaw.shared_secret = Rails.application.secrets.flickr_shared_secret

      flickr.photos.search(tags: params[:search_input], per_page: 10).each do |a|
        @results << a
      end
    end

    photos = @results.map { |p, _| p.build_img_url }
    render json: photos
  end
end
