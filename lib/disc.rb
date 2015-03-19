require "disc/version"

require 'disc/util'
require 'disc/disc_object'
require 'disc/topic_list'
require 'disc/topic'
require 'disc/post_stream'
require 'disc/post'
require 'disc/user'
require 'disc/thumbnail'

require 'discourse_api'

module Disc
  class NotFound < StandardError; end

  class << self
    attr_accessor :api_key, :api_username, :api_url
  end

  def self.client
    @client ||= ::DiscourseApi::Client.new(@api_url).tap do |client|
      client.api_key = @api_key
      client.api_username = @api_username
    end
  end

  def self.request(method, endpoint, params={})
    response = self.client.send(method, endpoint, params)
    raise NotFound if response.status == 404
    response
  end
end
