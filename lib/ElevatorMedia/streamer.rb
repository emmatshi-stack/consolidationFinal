require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'


class Streamer
    def getContent()
        response = HTTParty.get("https://apiconsolidation.azurewebsites.net/Elevators/2")
        puts response
        html_body="<div style='margin:0 auto; width:80%'><p><label>"+response['typeBuilding']+"</label></p>
                            <p><label>"+response['serialNumber']+"</label></p>
                            <p><label>id</label></p></div>"
    
        puts html_body
        #return html_body



        

    return html_body
    end
end

