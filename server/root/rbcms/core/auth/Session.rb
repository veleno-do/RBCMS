module SessionInterface
    def self.set
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    def self.get
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Session
    include SessionInterface
    attr_reader
    public
    @@storage = "root/rbcms/core/storage/"
    def self.set
        begin
            if !Dir.exist?(@@storage) then Dir.mkdir(@@storage) end
            Dir.open(@@storage).each{|f| if f != "." && f != ".." then File.delete(@@storage + f) end}
            filename = SecureRandom.hex(64).to_s
            file = File.open(@@storage + filename, "a")
        rescue => exception
            SysLogger.error exception.message
        ensure
            return filename
        end
    end

    def self.isset value
        admininfo = value.split("=")
        if admininfo[0] == "admininfo" && File.exist?(@@storage + admininfo[1]) then return true else return false end
    end
end
