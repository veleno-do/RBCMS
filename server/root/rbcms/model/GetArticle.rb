module ArticleInterface
    def self.get opt
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class Article
    include ArticleInterface
    attr_reader :opt
    public
    def self.get opt
        self.new(opt).sorting
    end

    def default
        {
            "count" => 5,
            "page" => 1,
            "category" => "",
            "date" => "",
            "search" => "",
        }
    end

    def sorting
        
    end

    def initialize opt
        @opt = default.merge opt
    end
end
