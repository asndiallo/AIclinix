# == Schema Information
#
# Table name: shap_values
#
#  id                          :uuid             not null, primary key
#  heart_disease_prediction_id :uuid             not null
#  feature_name                :string
#  shap_value                  :float
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
require "test_helper"

class ShapValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
