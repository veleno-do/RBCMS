module AdminUploadMediaControllerInterface
    def exec opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminUploadMediaController
    include AdminUploadMediaControllerInterface
    attr_reader
    public
    def exec opt
        
    end
end
