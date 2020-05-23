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
        if Session.isset opt.Cookie
            admin = AdminUser.get({
                "count" => 1000000,
            })
            return {
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
                        :article => admin["article"],
                        :categories => admin["categories"],
                        :themes => admin["themes"],
                        :commentlist => Comment.get("all"),
                    }
                )
            }
        else
            return {
                "status" => 200,
                "Contenttype" => "html",
                "body" => View.render(
                    'forbidden.html',
                )
            }
        end
    end

    def initialize opt
       @opt = opt
    end
end
