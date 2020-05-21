module FrontCategoryPagenateControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontCategoryPagenateController
    include FrontCategoryPagenateControllerInterface
    attr_reader :opt
    public
    def exec
        uri = pageinfo
        settings = AdminUser.get({
            "category" => uri["category"],
            "page" => uri["page"],
        })
        {
            "status" => 200,
            "Contenttype" => "html",
            "body" => View.render(
                'home.rhtml',
                {
                    :sitename => settings["sitename"],
                    :username => settings["username"],
                    :address => settings["address"],
                    :article => settings["article"],
                    :categories => settings["categories"],
                    :themes => settings["themes"],
                },
                "root/rbcms/themes/#{Theme.get}/",
            ),
        }
    end

    def pageinfo
        parsed = (opt.Uri).gsub(/^\/category\//,"").split("/")
        {
            "category" => parsed[0],
            "page" => parsed[1].to_i,
        }
    end

    def initialize opt
        @opt = opt
    end
end
