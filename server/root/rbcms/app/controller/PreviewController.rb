module PreviewControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class PreviewController
    include PreviewControllerInterface
    attr_reader :opt
    public
    def exec
        formatted = formatting
        settings = AdminUser.get
        if Token.check formatted["token"]
            return {
                "status" => 200,
                "Contenttype" => "html",
                "body" => View.render(
                    "page.rhtml",
                    {
                        :sitename => settings["sitename"],
                        :categories => settings["categories"],
                        :postTitle => formatted["postTitle"],
                        :postId => formatted["postId"],
                        :postCategory => formatted["postCategory"],
                        :postContent => formatted["postContent"],
                        :postDate => formatted["postDate"],
                        :postStyle => formatted["postStyle"],
                        :commentlist => Comment.get(formatted["postId"]),
                    },
                    "root/rbcms/themes/#{Theme.get}/",
                ),
            }
        else
            return {
                "status" => 400,
            }
        end
    end

    def formatting
        uri = opt.Posted
        begin
            data = Hash.new
            params = uri.split("&")
            params.each{|param| item = param.split("=",2);data.store(item[0],item[1])}
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data
        end
    end

    def initialize opt
        @opt = opt
    end
end
