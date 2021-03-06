module RouterInterface
    # uri を基にルーティングをし、コントローラーとオプションを返します
    def self.run(uri, method)
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Router
    include RouterInterface
    attr_reader :uri, :method, :tables
    public
    def self.run(uri, method)
        self.new(uri, method).getController
    end

    def getController
        begin
            result = NotFoundController
            tables.each do |table|
                if (uri.to_s.match(table["rule"]).nil? ? false : true) && method == table["method"] then result = table["controller"] end
            end
        rescue => exception
            SysLogger.error exception.message
        ensure
            return result
        end
    end

    def initialize(uri, method)
        @uri = uri
        @method = method
        @tables = RoutingRule.table
    end
end
