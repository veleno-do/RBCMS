module ContenttypeInterface
    def self.get id
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Contenttype
    include ContenttypeInterface
    attr_reader
    public
    def self.get id
        case id
        when "html" then return "Content-Type: text/html; charset=utf-8"
        end
    end
end
