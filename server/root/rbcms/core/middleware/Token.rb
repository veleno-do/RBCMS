module TokenInterface
    def self.set
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Token
    def self.set
        SetToken.create
    end

    def self.check token
        ParseToken.check token
    end
end
