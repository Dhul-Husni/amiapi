# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'rails/test_help'
require 'minitest/rails'
require 'webmock/minitest'

require 'simplecov'
SimpleCov.start 'rails'

if ENV['CI'] == true
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'minitest/reporters'
Minitest::Reporters.use!

require File.expand_path('../config/environment', __dir__)

Minitest::Ci.clean = false

Dir[Rails.root.join('test/support/**/*.rb')].sort.each { |f| require f }

module ActiveSupport
  class TestCase
    include ActiveJob::TestHelper
    include AuthorizationHelper

    parallelize(workers: 1)

    fixtures :all

    WebMock.disable_net_connect! allow_localhost: true, net_http_connect_on_start: true
  end
end
