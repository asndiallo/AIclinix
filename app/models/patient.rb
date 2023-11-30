# frozen_string_literal: true

# Purpose: Patient model
class Patient < ApplicationRecord
  enum sex: { male: 'male', female: 'female' }
  belongs_to :user

  has_many :heart_disease_predictions, dependent: :destroy
end
