module LoginControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class LoginController
    include LoginControllerInterface
    public
    def exec
        {
            "status" => 200,
            "Contenttype" => "html",
            "body" => View.render(
                'login.rhtml',
                {
                    :token => Token.set,
                },
            ),
        }
    end

    def initialize opt
        @opt = opt
    end
end
