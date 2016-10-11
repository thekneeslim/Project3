class AddSchoolQualificationDegreeGradToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :school, :text
    add_column :students, :qualification, :text
    add_column :students, :degree, :text
    add_column :students, :graduation, :date
  end
end
