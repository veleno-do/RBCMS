module FrontDateControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontDateController
    include FrontDateControllerInterface
    attr_reader :opt
    public
    def exec
       "FrontDate" 
    end

    def initialize opt
       @opt = opt
    end
end
