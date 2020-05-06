class Request
    attr_reader :env, :parser
    public
    def self.parser socket
        @parser = self.new socket
        if accessGate.whether
            return parser
        end
    end

    def accessGate
        AccessGate.new(env).examinor
    end

    def initialize socket
        @env = Analysisor.run socket
    end
end
