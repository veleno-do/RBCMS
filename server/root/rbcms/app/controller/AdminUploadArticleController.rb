module AdminUploadArticleControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminUploadArticleController
    include AdminUploadArticleControllerInterface
    attr_reader :opt
    public
    def exec
        if Upload.article opt.Posted
            return {
                "status" => 200,
            }
        else
            return {
                "status" => 200,
            }
        end
    end

    def initialize opt
        @opt = opt
    end
end
