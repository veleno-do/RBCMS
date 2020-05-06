require 'net/http'

class Location
    def self.to url
        url = URI.parse(url)
        req = Net::HTTP::Get.new(url.path)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }
        puts res.body
    end
end
