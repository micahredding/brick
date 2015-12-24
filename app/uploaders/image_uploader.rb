# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'jpg'
  # process :tags => ['post_picture']

  version :rss do
    process :resize_to_fill => [2048, 2048, :center]
  end

  version :standard do
    process :resize_to_fill => [220, 220, :center]
  end

  # version :square do
  #   process :eager => true
  #   process :resize_to_fill => [350, 350, :center]
  # end

  version :small do
    process :eager => true
    process :resize_to_fill => [180, 180, :center]
  end

  # version :thumbnail do
  #   resize_to_fit(50, 50)
  # end
end
