module IndividualControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class IndividualController
    include IndividualControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
