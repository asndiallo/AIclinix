# frozen_string_literal: true

# Job to call HeartDiseaseApiService
class HeartDiseasePredictionJob < ApplicationJob
  queue_as :default

  def perform(patient_record)
    # Call the HeartDiseaseApiService with the patient_record
    HeartDiseaseApiService.predict(patient_record)
  rescue StandardError => e
    # Log errors or take other error handling actions
    Rails.logger.error("HeartDiseasePredictionJob failed: #{e.message}")
  end
end
