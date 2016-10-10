class CreateJoinTableLanguagesStudents < ActiveRecord::Migration[5.0]
  def change
    create_join_table :languages, :students do |t|
      # t.index [:language_id, :student_id]
      # t.index [:student_id, :language_id]
    end
  end
end
