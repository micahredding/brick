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
      f.input :media
      f.input :media_length
      f.input :media_size
      f.input :summary
    end
    f.actions
  end

end
