class AddAddressToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :address_one, :string
    add_column :events, :address_two, :string
    add_column :events, :address_three, :string
  end
end
