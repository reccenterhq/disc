require "disc/version"
require 'disc/util'

require 'discourse_api'

module Disc

  class DiscObject
    include Enumerable

    def initialize(values)
      @values = values
      values.each do |k, v|
        @values[k] = Util.convert_to_disc_object(v, key: k)
      end
    end

    def [](k)
      @values[k.to_s]
    end

    def method_missing(name, *args)
      @values[name.to_s] if @values.has_key?(name.to_s)
    end
  end

  class TopicList < DiscObject
  end

  class User < DiscObject
  end

  class Topic < DiscObject
  end
end
