module TokenInterface
    def self.set
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Token
    def self.set
        if !File.directory?('db') then Dir.mkdir("db");Dir.mkdir("db/postdata");Dir.mkdir("db/comments") end
        SetToken.create
    end

    def self.check token
        ParseToken.check token
    end
end
