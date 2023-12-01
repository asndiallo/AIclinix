# frozen_string_literal: true

# == Schema Information
#
# Table name: heart_disease_predictions
#
#  id              :uuid             not null, primary key
#  patient_id      :uuid             not null
#  prediction      :integer
#  prediction_date :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class HeartDiseasePredictionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
