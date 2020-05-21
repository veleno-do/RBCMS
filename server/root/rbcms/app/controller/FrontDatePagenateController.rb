module FrontDatePagenateControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontDatePagenateController
    include FrontDatePagenateControllerInterface
    attr_reader :opt
    public
    def exec
        uri = pageinfo
        settings = AdminUser.get({
            "date" => uri["date"],
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
        parsed = (opt.Uri).gsub(/^\/date\//,"").split("/")
        {
            "date" => parsed[0],
            "page" => parsed[1].to_i,
        }
    end

    def initialize opt
        @opt = opt
    end
end
