ENV['RACK_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start
require 'byebug'
require 'rack/test'
require 'webmock'
require 'vcr'
require 'database_cleaner'
require 'shoulda/matchers'
require 'sidekiq/testing'
Sidekiq::Testing.fake!
require 'factory_bot'
require 'faker'
require 'dotenv/load'
require_relative '../web/app'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
require_relative '../lib/boot'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

module WebappMixin
  include Rack::Test::Methods
  def app() described_class end
end

RSpec.configure do |config|
  config.include WebappMixin
  config.include Shoulda::Matchers::ActiveModel, type: :model
  config.include Shoulda::Matchers::ActiveRecord, type: :model

  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.before(:suite) do
    FactoryBot.reload
    # DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
    c.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.warnings = true
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
  end
end

def response_body(response = nil)
  if response.present? && response.body.present?
    ActiveSupport::JSON.decode(response.body)
  else
    ActiveSupport::JSON.decode(last_response.body)
  end
end

def file_fixture(path)
  File.new("spec/support/fixtures/#{path}")
end


def clear_queue(queue)
  Sidekiq::Queue.new(queue).clear
end

HTTPResponseMock = Struct.new(:code, :body) do
  def parsed_response
    Oj.load(body.to_s)
  end
end
