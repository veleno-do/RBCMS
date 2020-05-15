module AdminPostControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminPostController
    include AdminPostControllerInterface
    attr_reader :opt
    public
    def exec
        "AdminPost"
    end

    def initialize opt
       @opt = opt
    end
end
