# frozen_string_literal: true

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
# Purpose: PatientRecord model
class PatientRecord < ApplicationRecord
  extend Enumerize

  belongs_to :patient

  enumerize :chest_pain_type, in: { typical_angina: 1, atypical_angina: 2, non_anginal_pain: 3, asymptomatic: 4 },
                              predicates: true
  enumerize :resting_electrocardiographic_results,
            in: { normal: 0, stt_wave_abnormality: 1, left_ventricular_hypertrophy: 2 }, predicates: true
  enumerize :slope, in: { upsloping: 1, flat: 2, downsloping: 3 }, predicates: true
  enumerize :thalassemia, in: { normal: 3, fixed_defect: 6, reversible_defect: 7 }, predicates: true
end
