# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id            :uuid             not null, primary key
#  first_name    :string
#  last_name     :string
#  date_of_birth :date
#  sex           :string           not null
#  user_id       :uuid             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Purpose: Patient model
class Patient < ApplicationRecord
  extend Enumerize
  belongs_to :user

  has_many :heart_disease_predictions, dependent: :destroy
end
