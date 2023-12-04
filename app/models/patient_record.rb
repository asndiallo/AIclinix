# frozen_string_literal: true

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
class PatientRecord < ApplicationRecord
  extend Enumerize

  belongs_to :patient

  # Enumerations
  enumerize :chest_pain_type, in: {typical_angina: 1, atypical_angina: 2, non_anginal_pain: 3, asymptomatic: 4},
                              predicates: true, scope: true
  enumerize :resting_ecg_results, in: {normal: 0, stt_wave_abnormality: 1, left_ventricular_hypertrophy: 2},
                                  predicates: true, scope: true
  enumerize :st_slope, in: {upsloping: 1, flat: 2, downsloping: 3}, predicates: true, scope: true
  enumerize :thalassemia, in: {normal: 3, fixed_defect: 6, reversible_defect: 7}, predicates: true, scope: true
end
