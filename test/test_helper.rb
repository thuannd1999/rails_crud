ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'factory_bot_rails'

class ActiveSupport::TestCase
  # Setup fixtures and enable FactoryBot
  fixtures :all
  FactoryBot.reload

  # Add more helper methods to be used by all tests here...
end

FactoryBot.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryBot.find_definitions