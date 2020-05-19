module ThemeInterface
    def self.getlist
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    def self.get
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Theme
    include ThemeInterface
    attr_reader
    public
    def self.getlist
        themedir = "root/rbcms/themes/"
        themeDatas = Array.new
        filedatas = Array.new
        begin
            Dir.glob(themedir+"*"){|dir| File.open(dir+"/themeInfo",mode="r",:encoding=>'UTF-8'){|filedata| data = filedata.gets.chomp("\n");filedatas.push(data)}}
            filedatas.each do |filedata|
                fileInfo = Hash.new
                filecontents = filedata.split(";")
                filecontents.each do |filecontent|
                    content = filecontent.split(":",2)
                    fileInfo.store(content[0],content[1])
                end
                themeDatas.push(fileInfo)
            end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return themeDatas
        end
    end

    def self.get
        GetTheme.run
    end
end

# 文民
