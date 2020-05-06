module AccessGateInterface
    # AccessGate.new したインスタンスを返します
    def examinor
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # アクセス可能か判断します。
    def whether
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class AccessGate
    include AccessGateInterface
    attr_reader :resource
    public
    def examinor
        
    end

    def whether
        
    end

    def initialize resource
        @resource = resource
    end
end
