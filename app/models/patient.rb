# frozen_string_literal: true

# Purpose: Patient model
class Patient < ApplicationRecord
  extend Enumerize
  belongs_to :user

  has_many :heart_disease_predictions, dependent: :destroy

  enumerize :sex, in: %i[male female], predicates: true
end
