module FrontCategoryControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontCategoryController
    include FrontCategoryControllerInterface
    attr_reader :opt
    public
    def exec
        "FrontCategory"
    end

    def initialize opt
       @opt = opt
    end
end
