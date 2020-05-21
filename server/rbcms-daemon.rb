# -*- coding: utf-8 -*-
require "socket"

server = TCPServer.open(80)

loop do
    Thread.new(server.accept) do |socket|
        load "root/rbcms/autoloader.rb"
        begin
            app             = App.create socket
            socket.write    "#{app.response}\r\n"
        ensure
            socket.close
        end
    end
end
