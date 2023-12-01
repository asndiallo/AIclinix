# frozen_string_literal: true

# Purpose: PatientRecord model
class CreatePatientRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :patient_records, id: :uuid do |t|
      t.references :patient, null: false, foreign_key: { to_table: :patients, on_delete: :cascade }, type: :uuid
      t.integer :chest_pain_type, null: false
      t.float :resting_blood_pressure
      t.float :serum_cholesterol_level
      t.integer :fasting_blood_sugar
      t.integer :resting_electrocardiographic_results, null: false
      t.integer :heart_rate_during_exercise
      t.boolean :exercise_induced_angina, default: false
      t.float :relative_to_rest_st_depression_induced_by_exercise
      t.integer :slope, null: false
      t.integer :number_colored_major_vessels
      t.integer :thalassemia, null: false

      t.datetime :recorded_at, null: false

      t.timestamps
    end
  end
end
