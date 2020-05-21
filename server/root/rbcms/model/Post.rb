module PostInterface
    def self.get uri
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Post
    include PostInterface
    attr_reader :uri
    public
    def self.get uri
        self.new(uri).run
    end

    def run
        result = false
        id = uri.gsub(/^\/post\//,"")
        begin
            Dir.glob("db/postdata/"+"*.db"){|dbfile| GDBM.open(dbfile,mode=nil,flags=GDBM::READER){|db| if db["postId"] == id then result = {
                "postId" => URI.decode(db["postId"]),
                "postTitle" => URI.decode(db["postTitle"]),
                "postCategory" => URI.decode(db["postCategory"]),
                "postDate" => URI.decode(db["postDate"]),
                "postContent" => URI.decode(db["postContent"]),
            } end}}
        rescue => exception
            SysLogger.error exception.message
        ensure
            return result
        end
    end

    def initialize uri
        @uri = uri
    end
end