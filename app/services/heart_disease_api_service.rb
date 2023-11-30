# frozen_string_literal: true

require 'httparty'

# Service object to call Heart Disease API
class HeartDiseaseApiService
  include HTTParty
  base_uri ENV['HEART_DISEASE_API_URL']

  def self.predict(data)
    response = post("/predict/", body: { data: data }.to_json, headers: { 'Content-Type' => 'application/json' })
    response.parsed_response if response.success?
  end
end
