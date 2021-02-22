class CreateStudentTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :student_teams do |t|
      t.references :student, foreign_key: true, null:false
      t.references :team, foreign_key: true, null:false
      t.date :start_date, null:false
      t.date :end_date
      t.integer :position, null:false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
