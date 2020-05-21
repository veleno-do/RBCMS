module FrontSearchPagenateControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontSearchPagenateController
    include FrontSearchPagenateControllerInterface
    attr_reader :opt
    public
    def exec
        uri = pageinfo
        settings = AdminUser.get({
            "search" => uri["search"],
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
        parsed = (opt.Uri).gsub(/^\/search\//,"").split("/")
        {
            "search" => parsed[0],
            "page" => parsed[1].to_i,
        }
    end

    def initialize opt
        @opt = opt
    end
end
