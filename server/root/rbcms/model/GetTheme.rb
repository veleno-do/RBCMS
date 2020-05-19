module GetThemeInterface
    def self.run
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class GetTheme
    include GetThemeInterface
    attr_reader
    public
    def self.run
        begin
            result = nil
            GDBM.open("db/settings.db",mode=nil,flags=GDBM::READER){|db| result=db["activeTheme"]}
        rescue => exception
            SysLogger.error exception.message
        ensure
            return result
        end
    end
end
