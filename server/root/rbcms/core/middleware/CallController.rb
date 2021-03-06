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
        router.new(opt).exec
    end

    def initialize(router, opt)
        @router = router
        @opt = opt
    end
end
