module ViewInterface
    def self.render(filename = String.new, opt = Hash.new)
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class View < OpenStruct
    include ViewInterface
    public
    @@path = 'root/rbcms/view/'
    def self.render(filename = String.new, opt = Hash.new)
        self.new(opt).render(@@path + filename)
    end

    def render filename
        ERB.new(File.read(filename)).result(binding)
    end
end
