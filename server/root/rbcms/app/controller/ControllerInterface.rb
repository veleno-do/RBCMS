module ControllerInterface
    # コントローラーを実行します。
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end
