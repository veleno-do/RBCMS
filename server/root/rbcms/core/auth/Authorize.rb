module AuthorizeInterface
    def self.check datas
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Authorize
    include AuthorizeInterface
    attr_reader
    public
    def self.check datas
        begin
            settings = GDBM.new('db/settings.db',mode=nil,flags=GDBM::READER)
            if settings["username"] == datas["username"] && settings["password"] == datas["password"] then return true else return false end
        rescue => exception
            SysLogger.error exception.message
        ensure
            settings.close
        end
    end
end
