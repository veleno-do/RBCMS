module AuthInterface
    def self.authentication value
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Auth
    include AuthInterface
    public
    def self.authentication value
        begin
            datas = Hash.new
            values = value.split("&")
            values.each do |value|
                item = value.split("=")
                datas[item[0]] = item[1]
            end
            if Token.check(datas["token"]) && Authorize.check(datas)
                return true
            else
                return false
            end
        rescue => exception
            SysLogger.error exception.message
        end
    end
end
