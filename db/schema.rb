# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_30_153552) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "heart_disease_predictions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "patient_id", null: false
    t.integer "prediction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_heart_disease_predictions_on_patient_id"
  end

  create_table "patient_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "patient_id", null: false
    t.integer "chest_pain_type", null: false
    t.float "resting_blood_pressure"
    t.float "serum_cholesterol"
    t.float "fasting_blood_sugar"
    t.integer "resting_ecg_results", null: false
    t.integer "max_heart_rate_achieved"
    t.boolean "exercise_induced_angina", default: false
    t.float "st_depression"
    t.integer "st_slope", null: false
    t.integer "number_colored_major_vessels"
    t.integer "thalassemia", null: false
    t.datetime "recorded_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_records_on_patient_id"
  end

  create_table "patients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "sex", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "recommendations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "heart_disease_prediction_id", null: false
    t.string "recommendation_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heart_disease_prediction_id"], name: "index_recommendations_on_heart_disease_prediction_id"
  end

  create_table "shap_values", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "heart_disease_prediction_id", null: false
    t.string "feature_name"
    t.float "shap_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heart_disease_prediction_id"], name: "index_shap_values_on_heart_disease_prediction_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "heart_disease_predictions", "patients"
  add_foreign_key "patient_records", "patients", on_delete: :cascade
  add_foreign_key "patients", "users"
  add_foreign_key "recommendations", "heart_disease_predictions"
  add_foreign_key "shap_values", "heart_disease_predictions"
end
