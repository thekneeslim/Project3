class AddProjectGifToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :project_gifs, :string
  end
end
