module AsyncCommentControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AsyncCommentController
    include AsyncCommentControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
