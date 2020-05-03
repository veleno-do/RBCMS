class App
    attr_reader :parsedRequest, :socket, :request
    public
    def self.create socket
        self.new socket
    end

    def head
        request.head
    end

    def content
        request.content
    end

    def initialize socket
        @socket = socket
        @request = parsedRequest
    end

    private
    def parsedRequest
        Request.parser socket
    end
end
