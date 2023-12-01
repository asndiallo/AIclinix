# == Schema Information
#
# Table name: patients
#
#  id            :uuid             not null, primary key
#  first_name    :string
#  last_name     :string
#  date_of_birth :date
#  sex           :string           not null
#  user_id       :uuid             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
