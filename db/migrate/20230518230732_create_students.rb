class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :responsible
      t.string :email
      t.date :birthdate
      t.string :username
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
