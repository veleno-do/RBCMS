module SanitizerInterface
    # XSS 対策で html エスケープ文字に変換させます
    def self.escape str
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end

    # 文字列が適切な値であるかをチェックします
    def self.validate str
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Sanitizer
    include SanitizerInterface
    attr_reader :arg
    public
    def self.escape target
        self.new(target).escaper
    end

    def escaper
        begin
            arg.gsub(/</,"&lt;").gsub(/>/,"&gt;").gsub(/&/,"&amp;").gsub(/"/,"&quot;").gsub(/¥/,"&yen;").gsub(/\s/,"&nbsp;").gsub(/©/,"&copy;")
        rescue => exception
            SysLogger.error exception.message
        ensure
            return arg
        end
    end

    def self.validate target
        self.new(target).validator
    end

    def validator
        begin
            case arg[:type]
            when "email" then
                return arg[:target].match(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/).nil? ? false : true
            when "url" then
                return arg[:target].match(/(https?|ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)/).nil? ? false : true
            when "domain" then
                return arg[:target].match(/^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z-]{2,}$/).nil? ? false : true
            when "tel" then
                return arg[:target].match(/^0\d(-\d{4}|\d-\d{3}|\d\d-\d\d|\d{3}-\d)-\d{4}$/).nil? ? false : true || arg[:target].match(/^0[789]0-\d{4}-\d{4}$/).nil? ? false : true
            end
        rescue => exception
            puts exception.message
        end
    end

    def initialize arg
        @arg = arg
    end
end
