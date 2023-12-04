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

  # Enumerized Fields Validation
  validates :chest_pain_type, inclusion: {in: chest_pain_type.values}
  validates :resting_ecg_results, inclusion: {in: resting_ecg_results.values}
  validates :st_slope, inclusion: {in: st_slope.values}
  validates :thalassemia, inclusion: {in: thalassemia.values}

  # Numericality Validations
  validates :resting_blood_pressure, :serum_cholesterol, :max_heart_rate_achieved, :st_depression,
            numericality: {greater_than: 0}, allow_nil: true
  validates :fasting_blood_sugar, :number_colored_major_vessels, numericality: {only_integer: true}, allow_nil: true

  # Others Validations
  validates :number_colored_major_vessels, inclusion: {in: 0..3}, allow_nil: true
  validates :exercise_induced_angina, inclusion: {in: [true, false]}, allow_nil: true
  validate :recorded_at_cannot_be_in_the_future

  private

  def recorded_at_cannot_be_in_the_future
    errors.add(:recorded_at, "can't be in the future") if recorded_at.present? && recorded_at > Time.zone.now
  end
end
