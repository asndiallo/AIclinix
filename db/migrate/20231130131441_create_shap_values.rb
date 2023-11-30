class CreateShapValues < ActiveRecord::Migration[7.1]
  def change
    create_table :shap_values, id: :uuid do |t|
      t.references :heart_disease_prediction, null: false, foreign_key: true, type: :uuid
      t.string :feature_name
      t.float :shap_value

      t.timestamps
    end
  end
end
