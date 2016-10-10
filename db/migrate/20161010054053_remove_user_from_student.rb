class RemoveUserFromStudent < ActiveRecord::Migration[5.0]
  def change
    remove_reference :students, :user, foreign_key: true
  end
end
