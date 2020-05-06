module RoutingRuleInterface
    # ルーティングルールを示したツリー構造のハッシュを返します。
    def self.tree
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class RoutingRule
    include RoutingRuleInterface
    public
    def self.table
        [
            {
                "controller"    => "FrontController@index",
                "rule"          => /\//,
                "method"        => "GET",
            },
            {
                "controller"    => "AdminController@index",
                "rule"          => /\/admin/,
                "method"        => "GET",
            },
        ]
    end
end
