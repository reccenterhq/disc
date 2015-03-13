module Disc
  class DiscObject
    include Enumerable

    def self.root(value)
      @root = value
    end

    def self.list(value)
      @list = value
    end

    def self.inherited(subclass)
      subclass.instance_variable_set(:@root, @root)
      subclass.instance_variable_set(:@list, @list)
      super
    end

    def initialize(values)
      @values = Util.symbolize_names(values)
      @values.each do |k, v|
        @values[k] = Util.convert_to_disc_object(v, key: k)
      end
    end

    def list
      self.class.instance_variable_get(:@list)
    end

    def root
      self.class.instance_variable_get(:@root)
    end

    def [](k)
      @values[k.to_sym]
    end

    def each(&blk)
      if root && list
        @values[root.to_sym][list.to_sym].each(&blk)
      else
        @values.each(&blk)
      end
    end

    def method_missing(name, *args)
      @values[name.to_sym] if @values.has_key?(name.to_sym)
    end

    def to_s(*args)
      JSON.pretty_generate(@values)
    end

    def inspect
      id_string = (self.respond_to?(:id) && !self.id.nil?) ? " id=#{self.id}" : ""
      "#<#{self.class}:0x#{self.object_id.to_s(16)}#{id_string}> JSON: " + JSON.pretty_generate(@values)
    end

    def to_json(*a)
      JSON.generate(@values)
    end

    def to_hash
      @values.inject({}) do |acc, (key, value)|
        acc[key] = value.respond_to?(:to_hash) ? value.to_hash : value
        acc
      end
    end

  end
end
