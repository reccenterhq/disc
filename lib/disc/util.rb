module Disc
  class Util
    def self.object_classes
      @object_classes ||= {
        'users' => User,
        'topic_list' => TopicList,
        'topics' => Topic
      }
    end

    def self.convert_to_disc_object(resp, key: nil)
      case resp
      when Array
        resp.map { |obj| convert_to_disc_object(obj, key: key) }
      when Hash
        self.object_classes.fetch(key, DiscObject).new(resp)
      else
        resp
      end
    end
  end
end
