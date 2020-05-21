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

    def content page
        ERB.new(File.read(path+"content.#{page}.rhtml")).result(binding)
    end

    def head
        ERB.new(File.read("root/rbcms/view/head.rhtml")).result(binding)
    end

    def foot
        ERB.new(File.read("root/rbcms/view/foot.rhtml")).result(binding)
    end

    def rbcmsScript
        File.read("root/rbcms/view/js/app.js")
    end

    def search
        ERB.new(File.read("root/rbcms/view/search.rhtml")).result(binding)
    end

    def pagenate
        ERB.new(File.read("root/rbcms/view/pagenate.rhtml")).result(binding)
    end

    def form
        ERB.new(File.read("root/rbcms/view/form.rhtml")).result(binding)
    end

    def comments
        ERB.new(File.read("root/rbcms/view/comments.rhtml")).result(binding)
    end
end
