# frozen_string_literal: true

# == Schema Information
#
# Table name: shap_values
#
#  id                          :uuid             not null, primary key
#  heart_disease_prediction_id :uuid             not null
#  feature_name                :string
#  shap_value                  :float
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
class ShapValue < ApplicationRecord
  belongs_to :heart_disease_prediction

  validates :feature_name, :shap_value, presence: true
  # TODO: Add validation for feature_name inclusion and shape_value numericality
end
