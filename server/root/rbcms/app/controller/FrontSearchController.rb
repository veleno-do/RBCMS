module FrontSearchControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontSearchController
    include FrontSearchControllerInterface
    attr_reader :opt
    public
    def exec
        settings = AdminUser.get({
            "search" => search,
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

    def search
        (opt.Uri).gsub(/^\/search\//,"").to_s
    end

    def initialize opt
       @opt = opt
    end
end
