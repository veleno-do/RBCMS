module AdminUserInterface
    def self.get(hash = Hash.new)
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AdminUser
    include AdminUserInterface
    attr_reader
    public
    def self.get(hash = Hash.new)
        begin
            settings = GDBM.new('db/settings.db',mode=nil,flags=GDBM::READER)
            getreq = Hash.new
            unless hash["count"].nil? then getreq.store("count",hash["count"]) else getreq.store("count",settings["pagenation"]) end
            unless hash["page"].nil? then getreq.store("page",hash["page"]) end
            unless hash["category"].nil? then getreq.store("category",hash["category"]) end
            unless hash["date"].nil? then getreq.store("date",hash["date"]) end
            unless hash["search"].nil? then getreq.store("search",hash["search"]) end
            data = {
                "sitename" => settings["sitename"],
                "username" => settings["username"],
                "address" => settings["address"],
                "whetherAddClass" => settings["whetherAddClass"],
                "whetherAddId" => settings["whetherAddId"],
                "whetherAddStyle" => settings["whetherAddStyle"],
                "pagenation" => settings["pagenation"],  
                "uriRule" => settings["uriRule"],
                "article" => Article.get(getreq),
                "categories" => Category.get,
                "themes" => Theme.getlist,
            }
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data
        end
    end
end
