class AddPictureUrlToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :picture_url, :string
  end
end
