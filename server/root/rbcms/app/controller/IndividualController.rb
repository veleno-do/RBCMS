module IndividualControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class IndividualController
    include IndividualControllerInterface
    attr_reader :opt
    public
    def exec
        settings = AdminUser.get
        post = Post.get(opt.Uri)
        if post
            return {
                "status" => 200,
                "Contenttype" => "html",
                "body" => View.render(
                    'page.rhtml',
                    {
                        :sitename => settings["sitename"],
                        :address => settings["address"],
                        :categories => settings["categories"],
                        :postId => post["postId"],
                        :postTitle => post["postTitle"],
                        :postCategory => post["postCategory"],
                        :postDate => post["postDate"],
                        :postContent => post["postContent"],
                        :token => Token.set,
                    },
                    "root/rbcms/themes/#{Theme.get}/",
                ),
            }
        else
            return {
                "status" => 404,
                "Contenttype" => "html",
                "body" => View.render(
                    "404.rhtml",
                    {

                    },
                    "root/rbcms/themes/#{Theme.get}/",
                )
            }
        end
    end

    def initialize opt
       @opt = opt
    end
end
