require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'


class Streamer
    def getContent()
        response = HTTParty.get("https://ipinfo.io/161.185.160.93/geo")
        case response.code
        when 200
            if response['region'].is_a? String and response['country'].is_a? String and response['city'].is_a? String
                html_body="<div style='margin:0 auto; width:80%'><p>"+response["city"]+"</p>
                                <p>"+response['region']+response["country"]+"</p>
                                </div>"
            else
                html_body ="<div> there is a problem with the API try again later</div>"
    
            end
          puts "All good!"

        when 404
          puts "O noes not found!"
          html_body ="<div> there is a problem with the API try again later</div>"
        when 500...600
          puts "ZOMG ERROR #{response.code}"
          html_body ="<div> there is a problem with the API try again later</div>"
        end
        puts response

        

    
        puts html_body
        #return html_body
        

    return html_body
    end
end

