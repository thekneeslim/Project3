class AddLinkToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :link, :string
  end
end
