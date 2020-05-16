module InstallerInterface
    def create
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    def self.create
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Installer
    include InstallerInterface
    attr_reader
    public
    def self.firstaccess?
        return GDBM.open('db/settings.db',mode = nil,flags = GDBM::READER).nil?
    end

    def self.create value
        begin
            datas = Hash.new
            values = value.split("&")
            values.each do |value|
                item = value.split("=")
                datas[item[0]] = item[1]
            end
            if Token.check datas["token"]
                self.default datas
            end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return true
        end
    end

    def self.default datas
        begin
            settings = GDBM.new('db/settings.db')
            posts = GDBM.new('db/posts.db')
            medias = GDBM.new('db/medias.db')
            comments = GDBM.new('db/comments.db')

            settings["username"] = datas["username"]
            settings["password"] = datas["password"]
            settings["address"] = datas["address"]
            settings["sitename"] = "NewBlog"
            settings["whetherAddClass"] = "on"
            settings["whetherAddId"] = "on"
            settings["whetherAddStyle"] = "on"
            settings["pagenation"] = "5"
            settings["uriRule"] = ""

            posts[1] = {
                "postTitle" => "Hello, world",
                "postId" => "helloWorld",
                "postStyle" => "",
                "postContent" => "こんにちは、最初の投稿です。削除してRBCMSを始めましょう。",
                "postCategory" => "なし",
            },

            settings.close
            posts.close
            medias.close
            comments.close
        rescue => exception
            SysLogger.error exception.message
        ensure
            return 0
        end
    end
end
