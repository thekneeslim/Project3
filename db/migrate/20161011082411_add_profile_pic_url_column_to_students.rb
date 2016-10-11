class AddProfilePicUrlColumnToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :profile_pic_url, :string
  end
end
