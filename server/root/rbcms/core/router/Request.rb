module RequestInterface
    # AccessGateで弾かれた場合を除いて、 socket より全てのリクエスト処理を終えレスポンスの取得が終わった状態の Request インスタンスを返します。
    def self.parser socket
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダのhtmpステータスコードを返します。
    def getResponsecode
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Date を返します。
    def getTransactionDate
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Server を返します。
    def getServerDescription
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Content-Length を返します。
    def getContentLength
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Keep-Alive を返します。
    def getKeepAlive
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Connection を返します。
    def getConnection
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Content-Type を返します。
    def getResponseContentType
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスヘッダの Connection: close を返します。
    def getHeaderfoot
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # レスポンスボディを返します。
    def getResponseBody
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # 処理結果に応じて HTTP レスポンスヘッダを形成します。
    def getHeader
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Request
    include RequestInterface
    attr_reader :env, :access, :router, :result, :parser
    public
    def self.parser socket
        parser = self.new socket
    end

    def getResponsecode

    end

    def getTransactionDate

    end

    def getServerDescription

    end

    def getContentLength

    end

    def getKeepAlive

    end

    def getConnection

    end

    def getResponseContentType

    end

    def getHeaderfoot

    end

    def getResponseBody

    end

    def getHeader

    end

    def initialize socket
        @env = Analysisor.run socket
        @access = AccessGate.new(env)
        @router = Router.run(env.Uri, env.Method)
        @result = CallController.run(router, env.Posted)
    end
end
