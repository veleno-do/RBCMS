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
        if Auth.authentication opt.Posted
            return {
                "status" => 200,
                "Cookie" => Session.set
            }
        else
            return {
                "status" => 400,
            }
        end
    end

    def initialize opt
        @opt = opt
    end
end
