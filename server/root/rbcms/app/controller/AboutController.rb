module AboutControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AboutController
    include AboutControllerInterface
    attr_reader :opt
    public
    def exec
        {
            "status" => 200,
            "Contenttype" => "html",
            "body" => View.render(
                "about.rhtml",
                {

                },
                "root/rbcms/themes/#{Theme.get}/",
            )
        }
    end

    def initialize opt
        @opt = opt
    end
end
