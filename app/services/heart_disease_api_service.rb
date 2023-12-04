# frozen_string_literal: true

require 'httparty'

# Service object to call Heart Disease API
class HeartDiseaseApiService
  include HTTParty
  base_uri ENV.fetch('HEART_DISEASE_API_URL', nil)

  def self.predict(patient_record)
    data = PatientDataTransformer.new(patient_record).transform
    response = post('/predict/', body: {data:}.to_json, headers: {'Content-Type' => 'application/json'})
    response.parsed_response if response.success?
  end
end

# Handles transformation of patient data for API consumption
class PatientDataTransformer
  attr_reader :patient_record, :patient

  def initialize(patient_record)
    @patient_record = patient_record
    @patient = patient_record.patient
  end

  def transform # rubocop:disable Metrics/AbcSize
    {
      age:      patient.age,
      sex:      patient.sex_value,
      cp:       patient_record.chest_pain_type_value,
      trestbps: patient_record.resting_blood_pressure,
      chol:     patient_record.serum_cholesterol,
      fbs:      fasting_blood_sugar,
      restecg:  patient_record.resting_ecg_results_value,
      thalach:  patient_record.max_heart_rate_achieved,
      exang:    exercise_induced_angina,
      oldpeak:  patient_record.st_depression,
      slope:    patient_record.st_slope_value,
      ca:       patient_record.number_colored_major_vessels,
      thal:     patient_record.thalassemia_value
    }
  end

  private

  def fasting_blood_sugar
    patient_record.fasting_blood_sugar > 120 ? 1 : 0
  end

  def exercise_induced_angina
    patient_record.exercise_induced_angina ? 1 : 0
  end
end
