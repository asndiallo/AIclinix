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
#  fasting_blood_sugar          :float
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

  HEART_DISEASE_PREDICTION_COLUMNS = [
    'chest_pain_type', 'resting_blood_pressure', 'serum_cholesterol',
    'fasting_blood_sugar', 'resting_ecg_results', 'max_heart_rate_achieved',
    'exercise_induced_angina', 'st_depression', 'st_slope',
    'number_colored_major_vessels', 'thalassemia'
  ].freeze

  # Enumerations
  enumerize :chest_pain_type, in: {typical_angina: 1, atypical_angina: 2, non_anginal_pain: 3, asymptomatic: 4},
                              predicates: true, scope: true
  enumerize :resting_ecg_results, in: {normal: 0, stt_wave_abnormality: 1, left_ventricular_hypertrophy: 2},
                                  predicates: true, scope: true
  enumerize :st_slope, in: {upsloping: 1, flat: 2, downsloping: 3}, predicates: true, scope: true
  enumerize :thalassemia, in: {normal: 1, fixed_defect: 2, reversible_defect: 3}, predicates: true, scope: true

  # Enumerized Fields Validation
  validates :chest_pain_type, inclusion: {in: chest_pain_type.values}
  validates :resting_ecg_results, inclusion: {in: resting_ecg_results.values}
  validates :st_slope, inclusion: {in: st_slope.values}
  validates :thalassemia, inclusion: {in: thalassemia.values}

  # Numericality Validations
  validates :resting_blood_pressure, :serum_cholesterol, :max_heart_rate_achieved, :st_depression, :fasting_blood_sugar,
            numericality: {greater_than: 0}, allow_nil: true
  validates :number_colored_major_vessels, numericality: {only_integer: true}, allow_nil: true

  # Others Validations
  validates :number_colored_major_vessels, inclusion: {in: 0..3}, allow_nil: true
  validates :exercise_induced_angina, inclusion: {in: [true, false]}, allow_nil: true
  validate :recorded_at_cannot_be_in_the_future

  after_save :trigger_heart_disease_prediction, if: :heart_disease_columns_changed?

  scope :of_patient, ->(patient) { where(patient:) }

  private

  def heart_disease_columns_changed?
    HEART_DISEASE_PREDICTION_COLUMNS.any? { |column| saved_change_to_attribute?(column) }
  end

  def trigger_heart_disease_prediction
    HeartDiseasePredictionJob.perform_later(self)
  end

  def recorded_at_cannot_be_in_the_future
    errors.add(:recorded_at, "can't be in the future") if recorded_at.present? && recorded_at > Time.zone.now
  end
end
