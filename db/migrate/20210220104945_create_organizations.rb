class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, null:false
      t.string :street_1, null: false
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip, null: false
      t.string :short_name, null: false
      t.boolean :active

      t.timestamps
    end
  end
end
