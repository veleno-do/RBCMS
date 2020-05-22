module CommentControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class CommentController
    include CommentControllerInterface
    attr_reader :opt
    public
    def exec
        formatted = formatting
        if Token.check formatted["token"]
            if Comment.create formatted
                return {
                    "status" => 200,
                }
            else
                return {
                    "status" => 400,
                }
            end
        else
            return {
                "status" => 400,
            }
        end
    end

    def formatting
        posted = opt.Posted
        begin
            data = Hash.new
            params = posted.split("&")
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
