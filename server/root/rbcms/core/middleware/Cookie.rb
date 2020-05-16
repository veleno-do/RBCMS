module CookieInterface
    def self.get value
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Cookie
    include CookieInterface
    attr_reader
    public
    def self.get value
        
    end
end
