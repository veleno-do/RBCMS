module UploadInterface
    def self.article
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Upload
    include UploadInterface
    attr_reader :posted
    public
    def self.article opt
        formatted = self.new(opt).formatt
        begin
            result = false
            if Token.check formatted["token"] then end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return result
        end
    end

    def formatt
        data = Hash.new
        posted = posted.split("&")
        posted.each{|param| item = param.split("=");data.store(item[0],item[1])}
        return data
    end

    def initialize opt
        @posted = opt
    end
end
