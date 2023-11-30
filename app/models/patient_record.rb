# frozen_string_literal: true

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
