class AddEventToStudent < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :event, foreign_key: true
  end
end
