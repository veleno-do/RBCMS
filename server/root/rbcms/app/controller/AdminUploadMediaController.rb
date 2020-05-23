module AdminUploadMediaControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminUploadMediaController
    include AdminUploadMediaControllerInterface
    attr_reader
    public
    def exe
        cgi = CGI.new
        SysLogger.debug cgi
    end

    def initialize opt
       @opt = opt
    end
end
