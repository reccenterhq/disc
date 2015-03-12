module Disc
  class TopicList < DiscObject

    def each(&blk)
      topics.each(&blk)
    end
  end
end
