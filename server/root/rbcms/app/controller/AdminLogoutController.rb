class AdminLogoutController
    attr_reader :opt
    public
    def exec
        storage = "root/rbcms/core/storage/"
        begin
            Dir.open(storage).each{|f| if f != "." && f != ".." then File.delete(storage + f) end}
        rescue => exception
            SysLogger.error exception.message
        ensure
            return {
                "status" => 200,
                "Contenttype" => "html",
                "body" => View.render(
                    "logout.html",
                ),
            }
        end
    end

    def initialize opt
        @opt = opt
    end
end
