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
            datas.each{|db| GDBM.open(db,mode=nil,flags=GDBM::READER){|db| if conditions(db) then i=data.length;data.store(i,Hash.new);db.each_pair{|key,value| data[i].store(key,URI.decode(value))} end}}
        rescue => exception
            SysLogger.error exception.message
        ensure
            return data.find_all{|key,value| ((opt["page"].to_i - 1) * opt["count"].to_i) <= key && key <= ((opt["page"].to_i * opt["count"].to_i) - 1)}
        end
    end

    def conditions db
        if opt["category"] != "" || opt["date"] != "" || opt["search"] != ""
            if opt["category"] != ""
                if db["postCategory"] == opt["category"]
                    return true
                else return false
                end
            elsif opt["date"] != ""
                if db["postDate"] == opt["date"]
                    return true
                else return false
                end
            elsif opt["search"] != ""
                if db["postTitle"].include?(opt["search"]) || db["postContent"].include?(opt["search"])
                    return true
                else return false
                end
            else
                return false
            end
        else
            return true
        end
    end

    def initialize opt
        @opt = default.merge opt
    end
end
