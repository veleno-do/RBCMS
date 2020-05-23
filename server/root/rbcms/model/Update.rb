module UpdateInterface
    def self.article posted
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Update
    include UpdateInterface
    attr_reader :data
    public
    def self.article posted
        self.new(posted).updateArticle
    end

    def updateArticle
        begin
            if Token.check data["token"]
                data.delete("token")
                Dir.glob("db/postdata/*.db"){|dbfile| GDBM.open(dbfile,mode=nil,flags=GDBM::READER){|db| if db["postId"] == data["postId"] then db.close;GDBM.open(dbfile,mode=nil,flags=GDBM::WRITER){|target| target.update(data)} end}}
            end            
        rescue => exception
            SysLogger.error exception.message
        ensure
            return true
        end
    end

    def initialize posted
        begin
            data = Hash.new
            params = posted.split("&")
            params.each{|param| item = param.split("=",2);data.store(item[0],item[1])}
        rescue => exception
            SysLogger.error exception.message
        ensure
            @data = data
        end
    end
end
