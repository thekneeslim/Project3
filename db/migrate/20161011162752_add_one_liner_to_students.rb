class AddOneLinerToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :one_liner, :string
  end
end
