# frozen_string_literal: true

# == Schema Information
#
# Table name: patient_records
#
#  id                           :uuid             not null, primary key
#  patient_id                   :uuid             not null
#  chest_pain_type              :integer          not null
#  resting_blood_pressure       :float
#  serum_cholesterol            :float
#  fasting_blood_sugar          :integer
#  resting_ecg_results          :integer          not null
#  max_heart_rate_achieved      :integer
#  exercise_induced_angina      :boolean          default(FALSE)
#  st_depression                :float
#  st_slope                     :integer          not null
#  number_colored_major_vessels :integer
#  thalassemia                  :integer          not null
#  recorded_at                  :datetime         not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
require 'test_helper'

class PatientRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
