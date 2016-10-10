class RemoveAdminFromCourse < ActiveRecord::Migration[5.0]
  def change
    remove_reference :courses, :admin, foreign_key: true
  end
end
