module ContenttypeInterface
    def self.get id
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Contenttype
    include ContenttypeInterface
    attr_reader
    public
    def self.get id
        prefix = "Content-Type: "
        suffix = "; charset=utf-8"
        case id
        when "html" then return "#{prefix}text/html#{suffix}"
        when "css"  then return "#{prefix}text/css#{suffix}"
        when "js"   then return "#{prefix}text/javascript#{suffix}"
        when "json" then return "#{prefix}application/json#{suffix}"
        when "jpeg" then return "#{prefix}image/jpeg#{suffix}"
        when "png"  then return "#{prefix}image/png#{suffix}"
        when "gif"  then return "#{prefix}image/gif#{suffix}"
        when "bmp"  then return "#{prefix}image/bmp#{suffix}"
        when "zip"  then return "#{prefix}application/zip#{suffix}"
        end
    end
end
