module ChangeThemeInterface
    def self.run param
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class ChangeTheme
    include ChangeThemeInterface
    attr_reader
    public
    def self.run param
        begin
            result = false
            data = Hash.new
            params = param.split("&")
            params.each{|param| item = param.split("=");data.store(item[0],item[1])}
            if Token.check data["token"]
                data.delete("token")
                GDBM.open("db/settings.db"){|db| db.update(data)}
            end
            result = true
        rescue => exception
            SysLogger.error exception.message
        ensure
            return result
        end
    end
end