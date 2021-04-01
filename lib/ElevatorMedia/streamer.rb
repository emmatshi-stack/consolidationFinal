require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'


class Streamer
    def getContent()
        response = HTTParty.get("https://ipinfo.io/161.185.160.93/geo")
        puts response

        if response['region'].is_a? String and response['country'].is_a? String and response['city'].is_a? String
            html_body="<div style='margin:0 auto; width:80%'><p>"+response["city"]+"</p>
                            <p>"+response['region']+response["country"]+"</p>
                            </div>"
        else
            html_body ="<div> there is a problem with the API try again later</div>"

        end

    
        puts html_body
        #return html_body
        

    return html_body
    end
end

