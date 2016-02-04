class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show]

  # GET /podcast_path/episode_number
  # GET /podcast_path/episode_number.json
  def show
    redirect_to(root_path) and return unless @podcast.present?
    redirect_to(podcast_path(@podcast.path)) and return unless @episode.present?
    redirect_to(podcast_path(@podcast.path)) and return unless @episode.published? || @episode.preview?
    @meta_url         = view_context.episode_url(@episode)
    @meta_type        = "article"
    @meta_title       = "#{@episode.title} | #{@podcast.title}"
    @meta_image       = @episode.override_image
    @meta_description = @episode.override_summary
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @podcast = Podcast.find_by_path(params[:podcast_path]) if params[:podcast_path]
      @episode = @podcast.episode(params[:episode_number]) if @podcast.present? && params[:episode_number]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def episode_params
    #   params.require(:episode).permit(:number, :title, :body, :recorded_at, :published_at, :image, :media, :media_length, :media_size, :podcast_id)
    # end
end
