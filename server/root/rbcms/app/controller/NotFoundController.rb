module NotFoundControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class NotFoundController
    include NotFoundControllerInterface
    attr_reader :opt
    public
    def exec
        {
            "status" => 404,
            "Contenttype" => "html",
            "body" => View.render(
                "404.rhtml",
                {

                },
                "root/rbcms/themes/default/",
            )
        }
    end

    def initialize opt
        @opt = opt
    end
end
