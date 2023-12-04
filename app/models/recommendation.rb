# frozen_string_literal: true

# == Schema Information
#
# Table name: recommendations
#
#  id                          :uuid             not null, primary key
#  heart_disease_prediction_id :uuid             not null
#  recommendation_key          :string
#  language                    :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
class Recommendation < ApplicationRecord
  belongs_to :heart_disease_prediction

  validates :recommendation_key, presence: true
  validates :recommendation_key, inclusion: {in: ['high_blood_pressure',
                                                  'high_cholesterol',
                                                  'high_fbs',
                                                  'high_risk',
                                                  'low_risk}']}
end
