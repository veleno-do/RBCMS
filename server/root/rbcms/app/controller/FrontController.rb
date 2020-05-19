module FrontControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class FrontController
    include FrontControllerInterface
    attr_reader :opt
    public
    def exec
        if Installer.firstaccess? then return StartController.start else return getResponse end
    end

    def getResponse
        settings = AdminUser.get
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

    def initialize opt
       @opt = opt
    end
end
