module AccessGateInterface
    # ルーティングからレスポンスを取得するまでを行い、結果を配列にして返します。
    def run
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AccessGate
    include AccessGateInterface
    attr_reader :env, :router
    public
    def run
        start
    end

    def start
        CallController.run(router, env)
    end

    def initialize env
        @env = env
        @router = Router.run(env.Uri, env.Method)
    end
end
