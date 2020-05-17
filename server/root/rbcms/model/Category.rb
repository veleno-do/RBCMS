module CategoryInterface
    def self.add param
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    def self.remove param
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    def self.get
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Category
    include CategoryInterface
    attr_reader
    public
    def self.add param
        begin
            result = false
            data = Hash.new
            params = param.split("&")
            params.each{|param| item = param.split("=");data.store(item[0],item[1])}
            if Token.check data["token"] then GDBM.open("db/categories.db",mode=nil,flags=GDBM::WRITER){|db| db[data["addCategory"]] = String.new};result = true end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return result
        end
    end

    def self.remove param
        begin
            result = false
            data = Hash.new
            params = param.split("&")
            params.each{|param| item = param.split("=");data.store(item[0],item[1])}
            if Token.check data["token"] then GDBM.open("db/categories.db",mode=nil,flags=GDBM::WRITER){|db| if db.has_key?(data["removeCategory"]) then db.delete(data["removeCategory"]) end};result = true end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return result
        end
    end

    def self.get
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
