class AddLinkToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :link, :string
  end
end
