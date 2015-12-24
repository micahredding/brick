ActiveAdmin.register Podcast do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :path, :title, :body, :image, :author, :keywords, :itunes, :email, :public, :category_ids => [], :category_podcast_association_ids => []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  filter :title

  index do
    column :title
    column :path
    column :body
    actions
  end

  form do |f|
    f.inputs do
      f.input :path
      f.input :title
      f.input :body
      f.input :image, :as => :cloudinary_image_upload
      f.input :author
      f.input :keywords
      f.input :categories, :as => :check_boxes
      f.input :itunes
      f.input :email, :as => :string
      f.input :public
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :path
      row :image
      row :body
      row :author
      row :keywords
      row :categories do |podcast|
        podcast.categories.map {|c| c.nice_name}
      end
      row :itunes
      row :email
    end

    table_for podcast.episodes do
      column :number
      column :title
      column :body
      column :actions do |episode|
        link_to 'edit', edit_admin_episode_path(episode)
      end
    end

  end

end
