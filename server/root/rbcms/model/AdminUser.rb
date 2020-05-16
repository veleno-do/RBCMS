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
                "article" => self.articles,
                "categories" => self.categories,
            }
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data
        end
    end

    def self.articles
        data = Hash.new
        database = "db/postdata/"
        begin
            Dir.open(database).each_with_index{|db,i| if db.include?(".db") then index=i-1;data.store(index,Hash.new);GDBM.open(database+db,mode=nil,flags=GDBM::READER).each_pair{|key,value| data[index].store(key,value);if data.length == 10 then break end} end}
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data
        end
    end

    def self.categories
        data = Array.new
        database = "db/categories.db"
        begin
            GDBM.open(database,mode=nil,flags=GDBM::READER).each_pair{|key,value| data.push(key)}            
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data
        end
    end
end
