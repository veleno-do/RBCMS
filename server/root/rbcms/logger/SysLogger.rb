class SysLogger < Logger
    public
    def self.getInstance file
        self.new( file, 'daily' )
    end

    def self.fileopen path
        file = File.open( path, File::WRONLY | File::APPEND | File::CREAT )
        file.sync = true
        file
    end

    def self.access body
        logger = self.getInstance(self.fileopen('root/log/access.log'))
        logger.info body
    end

    def self.error body
        logger = self.getInstance(self.fileopen('root/log/error.log'))
        logger.fatal body
    end

    def self.debug body
        logger = self.getInstance(self.fileopen('root/log/debug.log'))
        logger.debug body
    end

    def self.loadfile body
        logger = self.getInstance(self.fileopen('root/log/loadfile.log'))
        logger.info body
    end
end
