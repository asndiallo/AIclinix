# frozen_string_literal: true

# Purpose: PatientRecord model
class CreatePatientRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :patient_records, id: :uuid do |t|
      t.references :patient, null: false, foreign_key: true, type: :uuid
      t.integer :chest_pain_type
      t.float :resting_blood_pressure
      t.float :serum_cholesterol_level
      t.float :fasting_blood_sugar
      t.integer :resting_electrocardiographic_results
      t.integer :heart_rate_during_exercise
      t.boolean :exercise_induced_angina
      t.float :relative_to_rest_st_depression_induced_by_exercice
      t.integer :slope
      t.integer :number_colored_major_vessels
      t.integer :thalassemia
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
