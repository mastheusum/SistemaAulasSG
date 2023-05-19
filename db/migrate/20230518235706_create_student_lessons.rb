class CreateStudentLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :student_lessons do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.boolean :absent
      t.integer :RC
      t.integer :CP
      t.integer :AG
      t.integer :CM
      t.integer :AP
      t.integer :MV
      t.text :abstract

      t.timestamps
    end
  end
end
