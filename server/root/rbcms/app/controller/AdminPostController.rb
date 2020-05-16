module AdminPostControllerInterface
    def exec
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminPostController
    include AdminPostControllerInterface
    attr_reader :opt
    public
    def exec
        response = Hash.new
        begin
            if Console.request opt.Posted
                response = {
                    "status" => 200,
                }
            else
                response = {
                    "status" => 400,
                }
            end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return response
        end
    end

    def initialize opt
       @opt = opt
    end
end
