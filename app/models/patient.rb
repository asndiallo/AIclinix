# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id            :uuid             not null, primary key
#  first_name    :string
#  last_name     :string
#  date_of_birth :date
#  sex           :integer          not null
#  user_id       :uuid             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Patient < ApplicationRecord
  extend Enumerize
  belongs_to :user

  has_many :patient_records, dependent: :destroy
  has_many :heart_disease_predictions, dependent: :destroy

  # Enumerations
  enumerize :sex, in: {male: 1, female: 0}, predicates: true, scope: true

  validates :sex, presence: true, inclusion: {in: sex.values}
  validates :first_name, :last_name, presence: true, length: {maximum: 100, minimum: 2}
  validates :date_of_birth, presence: true
  validate :date_of_birth_should_be_in_the_past

  def age
    return unless date_of_birth

    now = Time.zone.now.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def date_of_birth_should_be_in_the_past
    errors.add(:date_of_birth, 'should be in the past') if date_of_birth.present? && date_of_birth > Time.zone.today
  end
end
