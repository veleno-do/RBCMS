module AdminIndexControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminIndexController
    include AdminIndexControllerInterface
    attr_reader :opt
    public
    def exec
        admin = AdminUser.get
        {
            "status" => 200,
            "Contenttype" => "html",
            "body" => View.render(
                'console.rhtml',
                {
                    :token => Token.set,
                    :sitename => admin["sitename"],
                    :username => admin["username"],
                    :address => admin["address"],
                    :whetherAddClass => admin["whetherAddClass"],
                    :whetherAddId => admin["whetherAddId"],
                    :whetherAddStyle => admin["whetherAddStyle"],
                    :pagenation => admin["pagenation"],
                    :uriRule => admin["uriRule"],
                }
            )
        }
    end

    def initialize opt
       @opt = opt
    end
end
