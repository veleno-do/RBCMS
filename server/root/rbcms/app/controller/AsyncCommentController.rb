module AsyncCommentControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AsyncCommentController
    include AsyncCommentControllerInterface
    attr_reader :opt
    public
    def exec
        "AsyncComment"
    end

    def initialize opt
       @opt = opt
    end
end
