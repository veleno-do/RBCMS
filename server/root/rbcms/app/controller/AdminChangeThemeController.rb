module AdminChangeThemeControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminChangeThemeController
    include AdminChangeThemeControllerInterface
    attr_reader :opt
    public
    def exec

    end

    def initialize opt
        @opt = opt
    end
end
