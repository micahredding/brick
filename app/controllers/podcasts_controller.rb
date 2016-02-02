class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :subscribe_new, :subscribe_create, :subscribe_success, :subscribe_error]

  # GET /podcasts
  # GET /podcasts.json
  def index
    @podcasts = Podcast.where(:public => true).order(:updated_at => :desc)
    @meta_title = Brick::SITETITLE
  end

  # GET /podcast_path
  # GET /podcast_path.json
  # GET /podcast_path.rss
  def show
    redirect_to(root_path) and return unless @podcast.present?
    @episodes = @podcast.episodes.published
    @meta_url         = view_context.podcast_url(@podcast)
    @meta_type        = "article"
    @meta_title       = @podcast.title
    @meta_image       = @podcast.image
    @meta_description = @podcast.body
  end

  def subscribe_new
    if params[:email].present?
      begin
        subscribe_email(params[:email])
        redirect_to podcast_subscribe_success_path(:podcast_path => @podcast.path) and return
      rescue Gibbon::MailChimpError => e
        redirect_to podcast_subscribe_error_path(:podcast_path => @podcast.path, :message => e.message) and return
      end
    end
    @podcast_show_header = false
    @podcast_show_footer = false
  end

  def subscribe_create
    begin
      subscribe_email(params[:email][:address])
      redirect_to podcast_subscribe_success_path(:podcast_path => @podcast.path) and return
    rescue Gibbon::MailChimpError => e
      redirect_to podcast_subscribe_error_path(:podcast_path => @podcast.path, :message => e.message) and return
    end
  end

  def subscribe_success
    @podcast_show_header = false
    @podcast_show_footer = false
  end

  def subscribe_error
    @podcast_show_header = false
    @podcast_show_footer = false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find_by_path(params[:podcast_path]) if params[:podcast_path]
    end

    def subscribe_email(email)
      @list_id = "61a457b26b"
      gb = Gibbon::Request.new
      gb.lists(@list_id).members.create(body: {:email_address => email, :status => "subscribed"})
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def podcast_params
    #   params.require(:podcast).permit(:path, :title, :body, :image, :author, :keywords, :category_ids => [])
    # end
end
