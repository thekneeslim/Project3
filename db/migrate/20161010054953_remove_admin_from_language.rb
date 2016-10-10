class RemoveAdminFromLanguage < ActiveRecord::Migration[5.0]
  def change
    remove_reference :languages, :admin, foreign_key: true
  end
end
