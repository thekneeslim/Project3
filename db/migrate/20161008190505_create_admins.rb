class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
