module UploadInterface
    def self.article opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Upload
    include UploadInterface
    attr_reader :posted
    public
    def self.article opt
        formatted = self.new(opt).formatting
        begin
            result = false
            if Token.check formatted["token"]
                filename = Time.now.strftime("%Y%m%d%H%M%S.db")
                db = GDBM.new('db/postdata/'+filename,flags=GDBM::NEWDB)
                db["postTitle"] = formatted["postTitle"]
                db["postId"] = formatted["postId"]
                db["postStyle"] = formatted["postStyle"]
                db["postContent"] = formatted["postContent"]
                db["postCategory"] = formatted["postCategory"]
                db["postDate"] = Time.now.strftime("%Y%m%d%H%M%S")
                db.close
                result = true
            end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return result
        end
    end

    def formatting
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
        @posted = opt
    end
end
