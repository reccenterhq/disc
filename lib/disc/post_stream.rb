module Disc
  class PostStream < DiscObject
    root :post_stream
    list :posts

    def self.find(id)
      response = Disc.request(:get, "/t/#{id}.json")
      self.new(response[:body])
    end
  end
end
