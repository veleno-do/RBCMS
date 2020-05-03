class Request
    attr_reader :env
    public
    def self.parser socket
        self.new socket
    end

    def head
        "HTTP/1.1 200 OK" # <- ステータスコード(仮)
    end

    def content
        ""
    end

    def initialize socket
        @env = Analysisor.run socket
    end

    private
end
