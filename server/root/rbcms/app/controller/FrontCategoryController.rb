module FrontCategoryControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontCategoryController
    include FrontCategoryControllerInterface
    attr_reader :opt
    public
    def exec
        settings = AdminUser.get({
            "category" => category,
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

    def category
        (opt.Uri).gsub(/^\/category\//,"").to_s
    end

    def initialize opt
       @opt = opt
    end
end
