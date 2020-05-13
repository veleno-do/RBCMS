class App
    attr_reader :parsedRequest, :socket, :request
    public
    def self.create socket
        self.new socket
    end

    def statuscode
        "HTTP/1.1 200 OK\r\n"
    end

    def transactionDate
        require 'date'
        "Date: #{Time.now.strftime("%a, %d %b %Y %H:%M:%S GMT")}\r\n"
    end

    def serverDescription
        "Server: #{RUBY_DESCRIPTION}\r\n"
    end

    def contentLength
        "Content-Length: #{responseBody.bytesize}\r\n"
    end

    def keepAlive
        "Keep-Alive: timeout=5, max=100\r\n"
    end

    def connection
        "Connection: Keep-Alive\r\n"
    end

    def responseContentType
        "Content-Type: text/html; charset=utf-8\r\n"
    end

    def headerfoot
        "Connection: close\r\n\r\n"
    end

    def responseBody
        "#{'<!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>post</title>
        </head> 
        <body>
            <form action="" method="POST">
                <input type="hidden" value="value" name="value" />
                <input type="submit" value="post" name="send" />
            </form>
        </body>
        </html>'}\r\n"
    end

    def getresponse
        "#{statuscode}#{transactionDate}#{serverDescription}#{contentLength}#{keepAlive}#{connection}#{responseContentType}#{headerfoot}#{responseBody}"
    end

    def postresponse
        "#{statuscode}#{transactionDate}#{serverDescription}#{contentLength}#{keepAlive}#{connection}#{responseContentType}#{headerfoot}#{responseBody}"
    end

    def putresponse
        "#{statuscode}"
    end

    def parsedRequest
        Request.parser socket
    end

    def response
        if request.env.Method == "GET" then return getresponse elsif request.env.Method == "POST" then return postresponse elsif request.env.Method == "PUT" then return putresponse end
    end

    def initialize socket
        @socket = socket
        @request = parsedRequest
    end
end
