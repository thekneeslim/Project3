class AddAdminToLanguage < ActiveRecord::Migration[5.0]
  def change
    add_reference :languages, :admin, foreign_key: true
  end
end
