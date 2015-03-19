module Disc
  class TopicList < DiscObject
    root :topic_list
    list :topics

    def self.latest(params={})
      response = Disc.request(:get, '/latest.json', params)
      self.new(response[:body])
    end

    def self.latest_for_category(slug, params={})
      response = Disc.request(:get, "/category/#{slug}/l/latest.json", params)
      self.new(response[:body])
    end
  end
end
