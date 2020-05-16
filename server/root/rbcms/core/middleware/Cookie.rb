module CookieInterface
    def self.set value
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Cookie
    include CookieInterface
    attr_reader
    public
    def self.set value
        "Set-Cookie: admininfo=#{value}; Max-Age=21600"
    end
end
