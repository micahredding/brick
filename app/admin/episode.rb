ActiveAdmin.register Episode do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :podcast_id, :number, :title, :body, :recorded_at, :published_at, :image, :media, :media_length, :media_size, :summary
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  member_action :load_media_values, method: :put do
    resource.get_media
    redirect_to resource_path, notice: "Media size and length loaded!"
  end

  index do
    column :podcast
    column :number
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :podcast
      f.input :number
      f.input :title
      f.input :body
      f.input :recorded_at
      f.input :published_at
      f.input :image, :as => :cloudinary_image_upload
      f.inputs "Media Wrapper" do
        f.input :media
        f.input :media_length
        f.input :media_size
        li "<p><a href='?check_remote_values=true'>Check media values</a></p>".html_safe
        li ("<p>#{link_to("Load and overwrite media values", load_media_values_admin_episode_path(f.object), :method => :put)}</p>").html_safe
        li "<p>Length: #{f.object.mp3_length}</p>".html_safe if params[:check_remote_values]
        li "<p>Size: #{f.object.mp3_size}</p>".html_safe     if params[:check_remote_values]
      end
      f.input :summary
    end
    f.actions
  end

end
