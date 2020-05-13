module AdminUploadThemeControllerInterface
    def exec aopt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminUploadThemeController
    include AdminUploadThemeControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
