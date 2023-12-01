# == Schema Information
#
# Table name: recommendations
#
#  id                          :uuid             not null, primary key
#  heart_disease_prediction_id :uuid             not null
#  recommendation_text         :text
#  language                    :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
require "test_helper"

class RecommendationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
