class DropTableCourses < ActiveRecord::Migration[5.0]
  def change
    drop_join_table :courses, :students 
  end
end
