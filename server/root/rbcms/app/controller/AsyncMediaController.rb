module AsyncMediaControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AsyncMediaController
    include AsyncMediaControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
