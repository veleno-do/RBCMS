module CommentInterface
    def self.create data
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    def self.get id
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Comment
    include CommentInterface
    attr_reader
    public
    def self.create data
        result = false
        begin
            filename = Time.now.strftime("%Y%m%d%H%M%S.db")
            db = GDBM.new('db/comments/'+filename,flags=GDBM::NEWDB)
            db["commentName"] = data["commentName"]
            db["commentText"] = data["commentText"]
            db["commentPost"] = data["commentPost"]
            db["commentDate"] = Time.now.strftime("%Y%m%d%H%M%S")
            result = true
        rescue => exception
            SysLogger.error exception.message
        ensure
            db.close
            return result
        end
    end

    def self.get id
        data = Hash.new
        database = "db/comments/"
        begin
            datas = Dir.glob(database+"*.db").sort_by{|dbfile| GDBM.open(dbfile,mode=nil,flags=GDBM::READER){|db| db["commentDate"]}}.reverse
            datas.each{|dbfile| GDBM.open(dbfile,mode=nil,flags=GDBM::READER){|db| if db["commentPost"] == id then i=data.length;data.store(i,Hash.new);db.each_pair{|key,value| data[i].store(key,URI.decode(value))} end}}
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data
        end
    end
end
