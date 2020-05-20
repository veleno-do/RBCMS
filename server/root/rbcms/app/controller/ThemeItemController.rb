module ThemeItemControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class ThemeItemController
    include ThemeItemControllerInterface
    attr_reader :opt
    public
    def exec
        item = ThemeItem.get(opt.Uri)
        if item["body"]
            return {
                "status" => 200,
                "Contenttype" => item["contenttype"],
                "body" => item["body"],
            }
        else
            return {
                "status" => 404,
            }
        end
    end

    def initialize opt
        @opt = opt
    end
end
