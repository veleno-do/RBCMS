module AdminIndexControllerInterface
    # コントローラーを実行します。
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminIndexController
    include AdminIndexControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
