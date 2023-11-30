# frozen_string_literal: true

# Purpose: HeartDiseasePrediction model. This model is used to store
# the prediction results of the heart disease prediction model.
class HeartDiseasePrediction < ApplicationRecord
  belongs_to :patient

  has_many :shap_values, dependent: :destroy
  has_many :recommendations, dependent: :destroy
end
