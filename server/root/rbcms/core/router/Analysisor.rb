module AnalysisorInterface
    def self.run
        # socket を解析した結果を環境変数として Env インスタンス変数に格納する
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Analysisor
    include AnalysisorInterface
    attr_reader :socket
    public
    def self.run socket
        self.new(socket).storeEnv
    end

    def storeEnv
        begin
            formatted = infoFormatter(split)
            envs = Hash.new
            buffer = String.new
            formatted.each do |env|
                if env.length == 2 then envs.store(env[0].to_s.intern, env[1]) elsif env[0] == "GET" || env[0] == "POST" then envs.store(:Method, env[0]);envs.store(:Uri, env[1]);envs.store(:Protocol, env[2]) else end
            end
            if envs[:Method] == "POST"
                envs[:ContentLength].to_i.times do
                    buffer << socket.getc
                end
                envs.store(:Posted, buffer)
            end
        rescue => exception
            SysLogger.error exception.message
        end
        Env.new(envs)
    end

    private
    def infoFormatter infomations
        results = Array.new
        begin
            infomations.each do |s|
                s = s.gsub(/\A/){|string| string.upcase} if not s == ""
                if s.include?(":") then arr = s.split(": ",2) else arr = s.split(" ") end
                arr[0] = arr[0].gsub(/-\w/){|string| string.delete("-").upcase} if arr.length == 2
                results.push(arr)
            end
        rescue => exception
            SysLogger.error exception.message
        end
        results
    end

    def split
        infomations = Array.new
        begin
            while info = socket.gets.chomp("\r\n")
                infomations.push(info)
                break if info == ''
            end
        rescue => exception
            SysLogger.error exception.message
        end
        infomations
    end

    def initialize socket
        @socket = socket
    end
end
