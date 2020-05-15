module AdminLoginControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminLoginController
    include AdminLoginControllerInterface
    attr_reader :opt
    public
    def exec
        {
            "status" => 400,
        }
    end

    def initialize opt
        @opt = opt
    end
end
