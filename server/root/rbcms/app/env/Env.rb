class Env
    attr_reader :defaults, :Method, :Uri, :Protocol, :Host, :Connection, :ContentLength, :CacheControl, :UpgradeInsecureRequests, :Origin, :ContentType, :UserAgent, :Accept, :SecFetchSite, :SecFetchMode, :SecFetchUser, :SecFetchDest, :Referer, :AcceptEncoding, :AcceptLanguage, :Posted
    public
    def defaults
        {
            :Method                     => "",
            :Uri                        => "",
            :Protocol                   => "HTPTP/1.1",
            :Host                       => "",
            :Connection                 => "keep-alive",
            :ContentLength              => "",
            :CacheControl               => "max-age=0",
            :UpgradeInsecureRequests    => 1,
            :Origin                     => "",
            :ContentType                => "",
            :UserAgent                  => "",
            :Accept                     => "Accept: text/html, application/xhtml+xml, application/xml;q=0.9, */*;q=0.8",
            :SecFetchSite               => "none",
            :SecFetchMode               => "navigate",
            :SecFetchUser               => "",
            :SecFetchDest               => "document",
            :Referer                    => "",
            :AcceptEncoding             => "gzip, deflate, br",
            :AcceptLanguage             => "ja,en-US;q=0.9,en;q=0.8",
            :Posted                     => "",
        }
    end

    def initialize arr
        arr = defaults.merge(arr)
        @Method                         = arr[:Method]
        @Uri                            = arr[:Uri]
        @Protocol                       = arr[:Protocol]
        @Host                           = arr[:Host]
        @Connection                     = arr[:Connection]
        @ContentLength                  = arr[:ContentLength]
        @CacheControl                   = arr[:CacheControl]
        @UpgradeInsecureRequests        = arr[:UpgradeInsecureRequests]
        @Origin                         = arr[:Origin]
        @ContentType                    = arr[:ContentType]
        @UserAgent                      = arr[:UserAgent]
        @Accept                         = arr[:Accept]
        @SecFetchSite                   = arr[:SecFetchSite]
        @SecFetchMode                   = arr[:SecFetchMode]
        @SecFetchUser                   = arr[:SecFetchUser]
        @SecFetchDest                   = arr[:SecFetchDest]
        @Referer                        = arr[:Referer]
        @AcceptEncoding                 = arr[:AcceptEncoding]
        @AcceptLanguage                 = arr[:AcceptLanguage]
        @Posted                         = arr[:Posted]
    end
end