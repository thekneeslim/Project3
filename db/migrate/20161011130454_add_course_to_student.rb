class AddCourseToStudent < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :course, foreign_key: true
  end
end
