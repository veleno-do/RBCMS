module SessionInterface
    def self.set
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    def self.get
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Session
    include SessionInterface
    attr_reader
    public
    def self.set

    end

    def self.get
        
    end
end
