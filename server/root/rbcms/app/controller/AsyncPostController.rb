module AsyncPostControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AsyncPostController
    include AsyncPostControllerInterface
    attr_reader :opt
    public
    def exec
       "AsyncPost" 
    end

    def initialize opt
       @opt = opt
    end
end
