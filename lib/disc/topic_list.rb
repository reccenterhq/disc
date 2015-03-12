module Disc
  class TopicList < DiscObject
    root :topic_list
    list :topics

    def self.latest
      response = Disc.client.get('/latest.json')
      self.new(response['body'])
    end
  end
end
