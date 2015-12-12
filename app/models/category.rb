class Category < ActiveRecord::Base
  has_and_belongs_to_many :podcasts

  def nice_name
    subtitle.present? ? "#{title} > #{subtitle}" : "#{title}"
  end
end
