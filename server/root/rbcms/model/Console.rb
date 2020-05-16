module ConsoleInterface
    def self.request param
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Console
    include ConsoleInterface
    attr_reader :param
    public
    def self.request param
        self.new(param).run
    end

    def run
        begin
            data = Hash.new
            params = param.split("&")
            params.each do |param|
                item = param.split("=")
                data[item[0]] = item[1]
            end
            if Token.check data["token"]
                settings = GDBM.new('db/settings.db',flags=GDBM::WRITER)
                settings.update(data)
            else
                return false
            end
        rescue => exception
            SysLogger.error exception.message
        ensure
            settings.close
            return true
        end
    end

    def initialize param
        @param = param
    end
end
