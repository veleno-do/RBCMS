class App
    public
    def self.create server
        self.new server
    end

    def head
        @request.head
    end

    def content
        @request.content
    end

    def initialize socket
        @socket = socket
        @infomation = access
        @request = parsedRequest
        AccessLogger.paccesslog @infomation # <- logging（仮）
    end

    private
    attr_reader :access, :parsedRequest
    def access
        arr = []
        while req = @socket.gets.chomp
            break if req == ''
            arr.push(req)
        end
        arr
    end

    def parsedRequest
        Request.parser @infomation
    end
end
