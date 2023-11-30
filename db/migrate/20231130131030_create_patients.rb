class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :sex, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
