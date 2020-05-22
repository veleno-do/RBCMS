module CommentInterface
    def self.create data
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    def self.get
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

    end
end
