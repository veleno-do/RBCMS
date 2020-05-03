module AnalysisorInterface
    def run
        # socket を解析した結果を環境変数として Env クラス変数に格納する
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Analysisor
    include AnalysisorInterface
    attr_reader :split, :infoFormatter, :socket
    public
    def self.run socket
        self.new(socket).storeEnv
    end

    def storeEnv
        begin
            formatted = infoFormatter(split)
            envs = Hash[]
            formatted.each do |env|
                if env.length == 2 then envs.store(env[0].to_s.intern, env[1]) elsif env[0] == "GET" || env[0] == "POST" then envs.store(:Method, env[0]);envs.store(:Uri, env[1]);envs.store(:Protocol, env[2]) else end
            end
        rescue => exception
            SysLogger.error exception.message            
        end
        Env.new(envs)
    end

    private
    def infoFormatter infomations
        results = []
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
        infomations = []
        begin
            while info = socket.gets.chomp
                infomations.push(info)
                break if info == ''
            end
            # メソッドが POST の場合のみもう一行 (value) 取得する
            infomations.push("Posted: #{socket.gets.chomp}") if infomations[0].include?("POST")
        rescue => exception
            SysLogger.error exception.message
        end
        infomations
    end

    def initialize socket
        @socket = socket
    end
end