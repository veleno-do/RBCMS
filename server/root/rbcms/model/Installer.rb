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
            # if Token.check datas["TOKEN"]
            #     settings = GDBM.new('db/settings.db')
            #     settings.replace(datas)
            #     settings.close
            # end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return true
        end
    end

    def self.default
        
    end
end
