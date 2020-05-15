module AdminUploadThemeControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminUploadThemeController
    include AdminUploadThemeControllerInterface
    attr_reader :opt
    public
    def exec
        "AdminUploadTheme"
    end

    def initialize opt
       @opt = opt
    end
end
