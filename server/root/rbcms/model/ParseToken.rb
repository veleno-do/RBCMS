module ParseTokenInterface
    def self.check token
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class ParseToken
    def self.check token
        data = GDBM.new('db/token.db',flags=GDBM::READER)
        if data["token"] == token then data.close;return true else data.close;return false end
    end
end
