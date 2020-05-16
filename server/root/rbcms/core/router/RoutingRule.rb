module RoutingRuleInterface
    # ルーティングルールを示したハッシュを返します。
    def self.table
        raise NotImplementedError.new("#{self.class}##{__method__} are not exist")
    end
end

class RoutingRule
    include RoutingRuleInterface
    public
    def self.table
        [
            {
                "controller"    => FrontController,
                "rule"          => /^\/$/,
                "method"        => "GET",
            },
            {
                "controller"    => LoginController,
                "rule"          => /^\/login$/,
                "method"        => "GET",
            },
            {
                "controller"    => AdminLoginController,
                "rule"          => /^\/admin\/login$/,
                "method"        => "POST",
            },
            {
                "controller"    => AdminLogoutController,
                "rule"          => /^\/admin\/logout$/,
                "method"        => "GET",
            },
            {
                "controller"    => AdminIndexController,
                "rule"          => /^\/admin$/,
                "method"        => "GET",
            },
            {
                "controller"    => AdminInstallController,
                "rule"          => /^\/admin\/install$/,
                "method"        => "POST"
            },
            {
                "controller"    => AdminPostController,
                "rule"          => /^\/admin\/post$/,
                "method"        => "POST",
            },
            {
                "controller"    => AdminArticleController,
                "rule"          => /^\/admin\/article$/,
                "method"        => "POST",
            },
            {
                "contoller"     => AdminUploadThemeController,
                "rule"          => /^\/admin\/upload\/theme$/,
                "method"        => "POST",
            },
            {
                "contoller"     => AdminUploadMediaController,
                "rule"          => /^\/admin\/upload\/media$/,
                "method"        => "POST",
            },
            {
                "controller"    => IndividualController,
                "rule"          => /^\/post\/\w+$/,
                "method"        => "GET",
            },
            {
                "controller"    => FrontCategoryController,
                "rule"          => /^\/category\/\w+$/,
                "method"        => "GET",
            },
            {
                "controller"    => FrontDateController,
                "rule"          => /^\/date\/\d+$/,
                "method"        => "GET",
            },
            {
                "controller"    => FrontSearchController,
                "rule"          => /^\/search\//,
                "method"        => "GET",
            },
            {
                "controller"    => AsyncMediaController,
                "rule"          => /^\/async\/medias\/\d+/,
                "method"        => "GET",
            },
            {
                "controller"    => AsyncPostController,
                "rule"          => /^\/async\/posts\/\d+/,
                "method"        => "GET",
            },
            {
                "controller"    => AsyncCommentController,
                "rule"          => /^\/async\/comments\/\d+/,
                "method"        => "GET",
            },
        ]
    end
end
