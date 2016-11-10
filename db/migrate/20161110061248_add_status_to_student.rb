class AddStatusToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :status, :integer
  end
end
