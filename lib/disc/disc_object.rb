module Disc
  class DiscObject
    include Enumerable

    def self.root(value)
      @root = value
    end

    def root
      self.class.instance_variable_get(:@root)
    end

    def self.list(value)
      @list = value
    end

    def list
      self.class.instance_variable_get(:@list)
    end

    def initialize(values)
      @values = values
      values.each do |k, v|
        @values[k] = Util.convert_to_disc_object(v, key: k)
      end
    end

    def [](k)
      @values[k.to_s]
    end

    def each(&blk)
      if root && list
        @values[root.to_s][list.to_s].each(&blk)
      else
        @values.each(&blk)
      end
    end

    def method_missing(name, *args)
      @values[name.to_s] if @values.has_key?(name.to_s)
    end

  end
end
