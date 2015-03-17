module Disc
  class Util
    def self.object_classes
      @object_classes ||= {
        users: User,
        topic_list: TopicList,
        topics: Topic,
        post_stream: PostStream,
        posts: Post,
        thumbnail: Thumbnail
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

    def self.symbolize_names(object)
      case object
      when Hash
        new_hash = {}
        object.each do |key, value|
          key = (key.to_sym rescue key) || key
          new_hash[key] = symbolize_names(value)
        end
        new_hash
      when Array
        object.map { |value| symbolize_names(value) }
      else
        object
      end
    end
  end
end
