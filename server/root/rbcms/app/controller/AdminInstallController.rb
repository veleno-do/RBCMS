module AdminInstallControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminInstallController
    include AdminInstallControllerInterface
    attr_reader :opt
    public
    def exec
        response = Array.new
        begin
            if Installer.create opt.Posted
                response = {
                    "status" => 200,
                }
            end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return response
        end
    end

    def initialize opt
        @opt = opt
    end
end
