class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_meta_tags, :only => [:index, :show]

  def set_meta_tags
    @meta_sitename        = Brick::SITETITLE
    @meta_url             = request.original_url
    @meta_type            = "blog"
    @meta_title           = @meta_sitename
    @meta_image           = "http://res.cloudinary.com/micahredding/image/upload/v1453084422/micah_instagram_500x500_ulcvcv.jpg"
    @meta_description     = @meta_sitename
    @meta_fb_admins       = "510967360"
    @meta_fb_app_id       = "1247388721942581"
    @meta_twitter_site    = "@micahtredding"
    @meta_twitter_creator = "@micahtredding"
  end
end
