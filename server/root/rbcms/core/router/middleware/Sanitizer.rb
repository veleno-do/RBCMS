module SanitizerInterface
    def escape str
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Sanitizer
    include SanitizerInterface
    attr_reader ;string
    public
    def escape str
        self.new(str).run
    end

    def run
        begin
            
        rescue => exception
            SysLogger.error exception.message            
        end
    end

    def initialize str
        @string = str
    end
end
