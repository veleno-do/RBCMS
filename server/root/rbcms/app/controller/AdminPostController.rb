module AdminPostControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminPostController
    include AdminPostControllerInterface
    attr_reader
    public
    def exec opt

    end
end
