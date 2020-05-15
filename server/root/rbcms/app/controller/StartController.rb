module StartControllerInterface
    def self.start
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class StartController
    include 
    public
    def self.start
        {
            "status" => 200,
            "Contenttype" => "html",
            "body" => View.render(
                'installer.rhtml',
                {
                    :token => Token.set,
                },
            ),
        }
    end
end
