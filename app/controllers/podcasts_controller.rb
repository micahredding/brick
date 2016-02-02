class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]

  # GET /podcasts
  # GET /podcasts.json
  def index
    @podcasts = Podcast.where(:public => true).order(:updated_at => :desc)
  end

  # GET /podcast_path
  # GET /podcast_path.json
  # GET /podcast_path.rss
  def show
    redirect_to(root_path) and return unless @podcast.present?
    @episodes = @podcast.episodes.published
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find_by_path(params[:podcast_path]) if params[:podcast_path]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def podcast_params
    #   params.require(:podcast).permit(:path, :title, :body, :image, :author, :keywords, :category_ids => [])
    # end
end
