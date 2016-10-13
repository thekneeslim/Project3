class AddVideoToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :video, :string
  end
end
