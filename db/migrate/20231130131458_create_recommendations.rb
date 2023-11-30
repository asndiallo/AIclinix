class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations, id: :uuid do |t|
      t.references :heart_disease_prediction, null: false, foreign_key: true, type: :uuid
      t.text :recommendation_text
      t.string :language

      t.timestamps
    end
  end
end
