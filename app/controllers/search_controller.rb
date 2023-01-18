class SearchController < ApplicationController
    def search
        @ip = params[:IP]
        searchbyIP(@ip)

    end
    private
    def request_api(url,ip)
      connection = Excon.new(url)
      @response = connection.get(:path =>"/shodan/host/#{ip}?key=wtzsth89ta3n3lRq2noowf4YQZCVDwV7")
      return nil if @response.status != 200
      @city =JSON.parse(@response.body)["city"]
      @region_code =JSON.parse(@response.body)["region_code"]
      @isp =JSON.parse(@response.body)["isp"]
      @ports =JSON.parse(@response.body)["ports"]
      @hostnames =JSON.parse(@response.body)["hostnames"]
      @country_code=JSON.parse(@response.body)["country_code"]
      @country_name =JSON.parse(@response.body)["country_name"]
      @domains =JSON.parse(@response.body)["domains"]
      @ip_str =JSON.parse(@response.body)["ip_str"]
    
    end
    def searchbyIP(ip)
      request_api(
        "https://api.shodan.io",ip
      )
    end
end