module AsyncPostControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AsyncPostController
    include AsyncPostControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
