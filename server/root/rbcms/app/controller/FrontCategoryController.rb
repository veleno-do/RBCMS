module FrontCategoryControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontCategoryController
    include FrontCategoryControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
