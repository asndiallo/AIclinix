# frozen_string_literal: true

require 'httparty'

# Service object to call Heart Disease API
class HeartDiseaseApiService
  include HTTParty
  base_uri ENV.fetch('HEART_DISEASE_API_URL', nil)

  def self.predict(patient_record)
    data = transform_patient_data(patient_record)
    response = post('/predict/', body: {data:}.to_json, headers: {'Content-Type' => 'application/json'})
    response.parsed_response if response.success?
  end

  private

  def transform_patient_data(patient_record) # rubocop:disable Metrics/MethodLength
    patient = patient_record.patient

    {
      age:      patient.age,
      sex:      patient.sex_value,
      cp:       patient_record.chest_pain_type_value, # Use the enumerize value method
      trestbps: patient_record.resting_blood_pressure,
      chol:     patient_record.serum_cholesterol,
      fbs:      patient_record.fasting_blood_sugar,
      restecg:  patient_record.resting_ecg_results_value,
      thalach:  patient_record.max_heart_rate_achieved,
      exang:    patient_record.exercise_induced_angina ? 1 : 0,
      oldpeak:  patient_record.st_depression,
      slope:    patient_record.st_slope_value,
      ca:       patient_record.number_colored_major_vessels,
      thal:     patient_record.thalassemia_value
    }
  end
end
