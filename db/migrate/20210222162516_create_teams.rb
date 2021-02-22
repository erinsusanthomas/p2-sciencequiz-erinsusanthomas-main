class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null:false
      t.references :organization, foreign_key: true, null:false
      t.string :division, null:false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
