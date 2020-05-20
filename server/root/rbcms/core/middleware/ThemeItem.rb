module ThemeItemInterface
    def self.get uri
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class ThemeItem
    include ThemeItemInterface
    attr_reader :uri
    public
    def self.get uri
        self.new(uri).reader
    end

    def reader
        path = "root/rbcms/themes/#{Theme.get}"
        item = uri.gsub(/\/theme-item/,"")
        type = String.new
        if item.include?(".css") then type = "css" elsif item.include?(".js") then type = "js" elsif item.include?(".jpeg") || item.include?(".jpg") then type = "jpeg" elsif item.include?(".png") then type = "png" elsif item.include?(".gif") then type = "gif" end
        return {
            "contenttype" => type,
            "body" => File.read(path+item),
        }
    end

    def initialize uri
        @uri = uri
    end
end
