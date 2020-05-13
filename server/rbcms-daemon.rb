require "socket"

server = TCPServer.open(80)

loop do
    Thread.new(server.accept) do |socket|
        load "#{ENV['HOME']}/root/rbcms/autoloader.rb"
        begin
            app             = App.create socket
            socket.write    "#{app.response}\r\n"
        rescue => exception
            SysLogger.error exception.message
        ensure
            socket.close
        end
    end
end
