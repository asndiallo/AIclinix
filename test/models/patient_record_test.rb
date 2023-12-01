# == Schema Information
#
# Table name: patient_records
#
#  id                                                 :uuid             not null, primary key
#  patient_id                                         :uuid             not null
#  chest_pain_type                                    :integer          not null
#  resting_blood_pressure                             :float
#  serum_cholesterol_level                            :float
#  fasting_blood_sugar                                :integer
#  resting_electrocardiographic_results               :integer          not null
#  heart_rate_during_exercise                         :integer
#  exercise_induced_angina                            :boolean          default(FALSE)
#  relative_to_rest_st_depression_induced_by_exercise :float
#  slope                                              :integer          not null
#  number_colored_major_vessels                       :integer
#  thalassemia                                        :integer          not null
#  recorded_at                                        :datetime         not null
#  created_at                                         :datetime         not null
#  updated_at                                         :datetime         not null
#
require "test_helper"

class PatientRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
