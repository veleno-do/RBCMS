module AdminUpdateArticleControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminUpdateArticleController
    include AdminUpdateArticleControllerInterface
    attr_reader :opt
    public
    def exec
        if Update.article opt.Posted
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
