module ContentTypeInterface
    def self.get id
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class ContentType
    include ContentTypeInterface
    attr_reader
    public
    def self.get id
        
    end
end
