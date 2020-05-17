module AdminUserInterface
    def self.get
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminUser
    include AdminUserInterface
    attr_reader
    public
    def self.get
        begin
            settings = GDBM.new('db/settings.db',mode=nil,flags=GDBM::READER)
            data = {
                "sitename" => settings["sitename"],
                "username" => settings["username"],
                "address" => settings["address"],
                "whetherAddClass" => settings["whetherAddClass"],
                "whetherAddId" => settings["whetherAddId"],
                "whetherAddStyle" => settings["whetherAddStyle"],
                "pagenation" => settings["pagenation"],
                "uriRule" => settings["uriRule"],
                "article" => Article.get({
                    "count" => 10,
                }),
                "categories" => Category.get,
            }
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data
        end
    end
end
