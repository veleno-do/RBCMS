module PagenationInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Paganation
    include PagenationInterface
    attr_reader :opt
    public
    def exec

    end

    def initialize opt
        @opt = opt
    end
end
