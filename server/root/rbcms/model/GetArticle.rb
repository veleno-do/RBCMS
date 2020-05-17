module ArticleInterface
    def self.get opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Article
    include ArticleInterface
    attr_reader :opt
    public
    def self.get opt
        self.new(opt).run
    end

    def default
        {
            "count" => 5,
            "page" => 1,
            "category" => "",
            "date" => "",
            "search" => "",
        }
    end

    def run
        data = Hash.new
        database = "db/postdata/"
        begin
            datas = Dir.glob(database+"*.db").sort_by{|dbfile| GDBM.open(dbfile,mode=nil,flags=GDBM::READER){|db| db["postDate"]}}.reverse
            datas.each_with_index{|db,i| data.store(i,Hash.new);GDBM.open(db,mode=nil,flags=GDBM::READER).each_pair{|key,value| data[i].store(key,value);if data.length == opt["count"] then break end}}
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data
        end

    end

    def initialize opt
        @opt = default.merge opt
    end
end
