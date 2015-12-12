class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]

  # GET /podcasts
  # GET /podcasts.json
  def index
    @podcasts = Podcast.all
  end

  # GET /podcasts/1
  # GET /podcasts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id]) if params[:id]
      @podcast = Podcast.find_by_path(params[:podcast_path]) if params[:podcast_path]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def podcast_params
      params.require(:podcast).permit(:path, :title, :body, :image, :author, :keywords, :category_ids => [])
    end
end
