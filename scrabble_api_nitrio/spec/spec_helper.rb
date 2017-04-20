ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rails/all'
require 'rspec/rails'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.mock_with :rspec
  config.color = true
  config.include Requests::JsonHelpers, type: :request

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view

end

