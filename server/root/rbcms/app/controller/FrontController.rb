module FrontControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontController
    include FrontControllerInterface
    attr_reader :opt
    public
    def exec
        response = String.new
        begin
            if Installer.firstaccess? then response = StartController.start else response = getResponse end
        rescue => exception
            SysLogger.error exception.message
        ensure
           return response
        end
    end

    def getResponse
        {
            "status" => 200,
            "body"   => "blogtop"
        }
    end

    def initialize opt
       @opt = opt
    end
end
