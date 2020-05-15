module IndividualControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class IndividualController
    include IndividualControllerInterface
    attr_reader :opt
    public
    def exec
        "Individual"
    end

    def initialize opt
       @opt = opt
    end
end
