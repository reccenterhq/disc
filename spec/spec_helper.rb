require 'bundler/setup'
Bundler.setup

require 'disc'

require 'discourse_api'
require 'rspec'
require 'webmock/rspec'
require 'pry'

RSpec.configure do |config|
end

require 'support/webmock_helper'
