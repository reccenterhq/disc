module Disc
  class TopicList < DiscObject
    root :topic_list
    list :topics

    def self.latest
      response = Disc.request(:get, '/latest.json')
      self.new(response[:body])
    end

    def self.latest_for_category(slug)
      response = Disc.request(:get, "/category/#{slug}/l/latest.json")
      self.new(response[:body])
    end
  end
end
