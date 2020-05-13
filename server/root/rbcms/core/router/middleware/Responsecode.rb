module ResponsecodeInterface
    def self.get responsenum
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Responsecode
    include ResponsecodeInterface
    attr_reader :num
    public
    @@html = "HTTP/1.1"

    def self.get responsenum
        case responsenum
        when 200 then return self.code200
        when 204 then return self.code201
        when 400 then return self.code400
        when 401 then return self.code401
        when 403 then return self.code403
        when 404 then return self.code404
        end
    end

    def self.code200
        "#{@@html} 200 OK"
    end

    def self.code204
        "#{@@html} 204 No Content"
    end

    def self.code400
        "#{@@html} 400 Bad Request"
    end

    def self.code401
        "#{@@html} 401 Unauthorized"
    end

    def self.code403
        "#{@@html} 403 Forbidden"
    end

    def self.code404
        "#{@@html} 404 Not Found"
    end
end
