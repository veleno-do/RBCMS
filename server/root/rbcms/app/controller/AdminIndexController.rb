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
        {
            "status" => 200,
            "Contenttype" => "html",
            "body" => View.render(
                'console.rhtml',
                {
                    :token => Token.set
                }
            )
        }
    end

    def initialize opt
       @opt = opt
    end
end
