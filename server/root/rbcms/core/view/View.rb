module ViewInterface
    def self.render(filename = String.new, opt = Hash.new, path = 'root/rbcms/view/')
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class View < OpenStruct
    include ViewInterface
    attr_reader :path
    public
    def self.render(filename = String.new, opt = Hash.new, path = 'root/rbcms/view/')
        self.new(opt).render(path,filename)
    end

    def render(path,filename)
        @path = path
        ERB.new(File.read(path+filename)).result(binding)
    end

    def header
        ERB.new(File.read(path+"header.rhtml")).result(binding)
    end

    def footer
        ERB.new(File.read(path+"footer.rhtml")).result(binding)
    end
end
