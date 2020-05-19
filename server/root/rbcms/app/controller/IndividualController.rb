module IndividualControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class IndividualController
    include IndividualControllerInterface
    attr_reader :opt
    public
    def exec
        {
            "status" => 200,
            "Contenttype" => "html",
            "body" => View.render(
                'page.rhtml',
                {

                },
                "root/rbcms/themes/#{Theme.get}/",
            ),
        }
    end

    def initialize opt
       @opt = opt
    end
end
