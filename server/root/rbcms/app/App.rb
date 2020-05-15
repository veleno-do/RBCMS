class App
    attr_reader :parsedRequest, :socket, :request
    public
    def self.create socket
        self.new socket
    end

    def statuscode
        request.getStatuscode
    end

    def transactionDate
        request.getTransactionDate
    end

    def serverDescription
        "Server: #{RUBY_DESCRIPTION}\r\n"
    end

    def contentLength
        request.getContentlength
    end

    def keepAlive
        "Keep-Alive: timeout=5, max=100\r\n"
    end

    def connection
        "Connection: Keep-Alive\r\n"
    end

    def responseContentType
        request.getContenttype
    end

    def redirect
        request.getLocation
    end

    def cookie
        request.getCookie
    end

    def diverted
        "\r\n"
    end

    def responseBody
        request.getResponseBody
    end

    def response
        statuscode + transactionDate + serverDescription + contentLength + keepAlive + connection + responseContentType + redirect + cookie + diverted + responseBody
    end

    def parsedRequest
        Request.parser socket
    end

    def initialize socket
        @socket = socket
        @request = parsedRequest
    end
end
