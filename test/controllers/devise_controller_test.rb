class DeviseControllerTest < ActionController::TestCase
# For Devise >= 4.2.0
  include Devise::Test::ControllerHelpers
# Use the following instead if you are on Devise <= 4.2.0
# include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryBot.create(:admin)
  end
end