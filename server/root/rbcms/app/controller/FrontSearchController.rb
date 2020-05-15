module FrontSearchControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontSearchController
    include FrontSearchControllerInterface
    attr_reader :opt
    public
    def exec
        "FrontSearch"
    end

    def initialize opt
       @opt = opt
    end
end
