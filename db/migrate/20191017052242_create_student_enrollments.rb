class CreateStudentEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :student_enrollments do |t|
      t.integer :student_id
      t.integer :klasses_id
      t.integer :student_count

      t.timestamps
    end
  end
end
