module LocationInterface
    def self.get uri
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Location
    def self.get uri
        return "Location: #{uri}"
    end
end
