# == Schema Information
#
# Table name: patient_records
#
#  id                                                 :uuid             not null, primary key
#  patient_id                                         :uuid             not null
#  chest_pain_type                                    :integer
#  resting_blood_pressure                             :float
#  serum_cholesterol_level                            :float
#  fasting_blood_sugar                                :float
#  resting_electrocardiographic_results               :integer
#  heart_rate_during_exercise                         :integer
#  exercise_induced_angina                            :boolean
#  relative_to_rest_st_depression_induced_by_exercice :float
#  slope                                              :integer
#  number_colored_major_vessels                       :integer
#  thalassemia                                        :integer
#  recorded_at                                        :datetime
#  created_at                                         :datetime         not null
#  updated_at                                         :datetime         not null
#
require "test_helper"

class PatientRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
