module AsyncMediaControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AsyncMediaController
    include AsyncMediaControllerInterface
    attr_reader :opt
    public
    def exec
       "AsyncMedia" 
    end

    def initialize opt
       @opt = opt
    end
end
