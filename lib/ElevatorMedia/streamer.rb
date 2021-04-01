require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'


class Streamer
    def getContent()
        response = HTTParty.get("https://apiconsolidation.azurewebsites.net/Elevators/2")
        
        puts response
        html_body="<div style='margin:0 auto; width:80%'><p>"+response['typeBuilding']+"</p>
                            <p>"+response['serialNumber']+response['typeBuilding']+"</p>
                            </div>"
    
        puts html_body
        #return html_body
        

    return html_body
    end
end

