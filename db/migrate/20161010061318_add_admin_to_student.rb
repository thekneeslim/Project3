class AddAdminToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :admin, :boolean
  end
end
