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
        if ChangeTheme.run opt.Posted
            return {
                "status" => 200,
            }
        else
            return {
                "status" => 400,
            }
        end
    end

    def initialize opt
        @opt = opt
    end
end
