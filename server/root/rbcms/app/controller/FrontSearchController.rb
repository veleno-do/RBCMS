module FrontSearchControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontSearchController
    include FrontSearchControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
