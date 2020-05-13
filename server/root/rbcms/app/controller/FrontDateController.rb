module FrontDateControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontDateController
    include FrontDateControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
