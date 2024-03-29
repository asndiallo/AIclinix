# frozen_string_literal: true

# == Schema Information
#
# Table name: heart_disease_predictions
#
#  id         :uuid             not null, primary key
#  patient_id :uuid             not null
#  prediction :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class HeartDiseasePrediction < ApplicationRecord
  belongs_to :patient

  has_many :shap_values, dependent: :destroy
  has_many :recommendations, dependent: :destroy

  validates :prediction, presence: true
  validates :prediction, inclusion: {in: [0, 1]}
end
