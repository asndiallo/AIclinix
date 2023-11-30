class CreateHeartDiseasePredictions < ActiveRecord::Migration[7.1]
  def change
    create_table :heart_disease_predictions, id: :uuid do |t|
      t.references :patient, null: false, foreign_key: true, type: :uuid
      t.integer :prediction
      t.datetime :prediction_date

      t.timestamps
    end
  end
end
