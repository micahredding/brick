ActiveAdmin.register Podcast do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    column :title
    column :path
    column :body
    actions
  end

  show do
    attributes_table do
      row :title
      row :path
      row :image
      row :body
      row :author
      row :keywords
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
