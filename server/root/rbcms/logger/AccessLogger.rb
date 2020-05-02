require 'logger'

class AccessLogger < Logger
    public
    @@logpath = 'root/log/access.log'
    @@loggerInstance = nil

    def self.paccesslog body
        file = File.open( @@logpath, File::WRONLY | File::APPEND | File::CREAT )
        file.sync = true
        @@loggerInstance = self.new( file, 'daily' ) if not @@loggerInstance
        @@loggerInstance.info( body )
        return 0
    end
end
