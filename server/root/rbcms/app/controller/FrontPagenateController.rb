module FrontPagenateControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontPagenateController
    include FrontPagenateControllerInterface
    attr_reader :opt
    public
    def exec
        page = pagenum(opt.Uri)
        settings = AdminUser.get({
            "page" => page,
        })
        {
            "status" => 200,
            "Contenttype" => "html",
            "body" => View.render(
                "home.rhtml",
                {
                    :sitename => settings["sitename"],
                    :username => settings["username"],
                    :address => settings["address"],
                    :article => settings["article"],
                    :categories => settings["categories"],
                    :themes => settings["themes"],
                },
                "root/rbcms/themes/#{Theme.get}/",
            )
        }
    end

    def pagenum uri
        uri.gsub(/^\//,"").to_i
    end

    def initialize opt
        @opt = opt
    end
end
