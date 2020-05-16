module AdminArticleControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminArticleController
    include AdminArticleControllerInterface
    attr_reader :opt
    public
    def exec

    end

    def intialize opt
        @opt = opt
    end
end
