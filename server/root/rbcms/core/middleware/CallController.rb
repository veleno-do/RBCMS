module CallControllerInterface
    def self.run(router, env)
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class CallController
    include CallControllerInterface
    attr_reader :router, :opt
    public
    def self.run(router, opt)
        self.new(router, opt).controller
    end

    def controller
        begin
            name = FrontController
            result = name.new.index
        rescue => exception
            SysLogger.error exception.message
        ensure
            SysLogger.debug result.to_s
            return result
        end
    end

    def initialize(router, opt)
        @router = router
        @opt = opt
    end
end
