module RequestInterface
    # AccessGateで弾かれた場合を除いて、 socket より全てのリクエスト処理を終えレスポンスの取得が終わった状態の Request インスタンスを返します。
    def self.parser socket
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダのhtmpステータスコードを返します。
    def getStatuscode
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Date を返します。
    def getTransactionDate
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Content-Length を返します。
    def getContentlength
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Content-Type を返します。
    def getContenttype
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Content-Type を返します。
    def getResponseContentType
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # 必要に応じてレスポンスヘッダの Location を返します。
    def getLocation
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # 必要に応じてレスポンスヘッダの Set-Cookie を返します。
    def getCookie
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスボディを返します。
    def getResponseBody
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Request
    include RequestInterface
    attr_reader :env, :response
    public
    def self.parser socket
        parser = self.new socket
    end

    def getStatuscode
        "#{Responsecode.get response["status"]}\r\n"
    end

    def getTransactionDate
        "Date: #{Time.now.strftime("%a, %d %b %Y %H:%M:%S GMT")}\r\n"
    end

    def getContentlength
        if !response["body"].nil? then return "Content-Length: #{getResponseBody.bytesize}\r\n" else return "" end
    end

    def getContenttype
        if !response["Contenttype"].nil? then return "#{Contenttype.get response["Contenttype"]}\r\n" else return "" end
    end

    def getLocation
        if !response["Location"].nil? then return "#{Location.get response["Location"]}\r\n" else return "" end
    end

    def getCookie
        if !response["Cookie"].nil? then return "#{Cookie.get response["Cookie"]}\r\n" else return "" end
    end

    def getResponseBody
        if !response["body"].nil? then return "#{response["body"]}\r\n" else return "" end
    end

    def initialize socket
        @env = Analysisor.run socket
        @response = AccessGate.new(env).run
    end
end
