module AccessGateInterface
    # アクセス可能か判断します。
    def whether
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AccessGate
    include AccessGateInterface
    attr_reader :env
    public
    def whether
        true
    end

    def initialize env
        @env = env
    end
end
