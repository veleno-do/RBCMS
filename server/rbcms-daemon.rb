require "socket"

server = TCPServer.open(80)
addr = server.addr
addr.shift
printf("server is on %s\n", addr.join(":"))

loop do
    Thread.new( server.accept ) do |socket|
        load "#{ENV['HOME']}/root/rbcms/autoloader.rb"
        begin
            
            app             = App.create socket
            head            = app.head
            content         = app.content

            socket.write    "#{head}\r\n"
            socket.write    "Server: #{RUBY_DESCRIPTION}\r\n"
            socket.write    "Content-Type: text/html; charset=utf-8\r\n"
            socket.write    "Content-Length: #{content.bytesize}\r\n"
            socket.write    "Connection: close\r\n"
            socket.write    "\r\n"

            socket.write    "#{content}\r\n"

        ensure
            app = nil
            socket.close
        end
    end
end
