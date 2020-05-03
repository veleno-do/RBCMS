class Env
    attr_reader :defaults, :Method, :Uri, :Protocol, :Host, :Connection, :CacheControl, :UpgradeInsecureRequests, :UserAgent, :Accept, :SecFetchSite, :SecFetchMode, :SecFetchUser, :SecFetchDest, :AcceptEncoding, :AcceptLanguage
    public
    def defaults
        {
            :Method                     => "",
            :Uri                        => "",
            :Protocol                   => "HTPTP/1.1",
            :Host                       => "",
            :Connection                 => "keep-alive",
            :CacheControl               => "max-age=0",
            :UpgradeInsecureRequests    => 1,
            :UserAgent                  => "",
            :Accept                     => "Accept: text/html, application/xhtml+xml, application/xml;q=0.9, */*;q=0.8",
            :SecFetchSite               => "none",
            :SecFetchMode               => "navigate",
            :SecFetchUser               => "",
            :SecFetchDest               => "document",
            :AcceptEncoding             => "gzip, deflate, br",
            :AcceptLanguage             => "ja,en-US;q=0.9,en;q=0.8",
        }
    end

    def initialize arr
        arr = defaults.merge(arr)
        @Method                         = arr[:Method]
        @Uri                            = arr[:Uri]
        @Protocol                       = arr[:Protocol]
        @Host                           = arr[:Host]
        @Connection                     = arr[:Connection]
        @CacheControl                   = arr[:CacheControl]
        @UpgradeInsecureRequests        = arr[:UpgradeInsecureRequests]
        @UserAgent                      = arr[:UserAgent]
        @Accept                         = arr[:Accept]
        @SecFetchSite                   = arr[:SecFetchSite]
        @SecFetchMode                   = arr[:SecFetchMode]
        @SecFetchUser                   = arr[:SecFetchUser]
        @SecFetchDest                   = arr[:SecFetchDest]
        @AcceptEncoding                 = arr[:AcceptEncoding]
        @AcceptLanguage                 = arr[:AcceptLanguage]
    end
end