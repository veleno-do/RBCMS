module FrontControllerInterface
    # コントローラーを実行します。
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontController
    include FrontControllerInterface
    attr_reader
    public
    def exec opt
        return 0
    end

    def index
        "index"
    end

    def initialize
        
    end
end
