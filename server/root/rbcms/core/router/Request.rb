class Request
    public
    def self.parser infomation
        return self.new infomation
    end

    def head
        "HTTP/1.1 200 OK" # <- ステータスコード(仮)
    end

    def content
        
    end

    def initialize infomation
        @infomation = infomation
    end

    private
    attr_reader
end
