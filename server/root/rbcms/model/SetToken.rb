module SetTokenInterface
    def self.create
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class SetToken
    include SetTokenInterface
    attr_reader
    public
    def self.create
        token = SecureRandom.hex(32)
        begin
            tokendb = GDBM.new('db/token.db',flags = GDBM::NEWDB)
            tokendb["token"] = token
            token.close
        rescue => exception
            Syslogger.error exception.message
        ensure
            return token
        end
    end
end
