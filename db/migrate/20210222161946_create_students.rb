class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.integer :grade, null:false
      t.references :organization, foreign_key: true, null:false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
