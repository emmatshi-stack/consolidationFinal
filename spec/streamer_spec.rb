require 'nokogiri'
require 'open-uri'
require 'json'
require 'net/http'
require 'httparty'

require 'ElevatorMedia/streamer'

describe Streamer do

    

    it "returns a string" do
        streamerOne = Streamer.new
        var = streamerOne.getContent()
        expect(var).to be_a(String) 

    end


    it "returns a html tag at the end " do
        streamerOne = Streamer.new
        var = streamerOne.getContent()
        expect(var).to end_with "</div>"
       
    end

    it "returns a html tag at the start " do
        streamerOne = Streamer.new
        var = streamerOne.getContent()
        expect(var).to start_with "<div"
    end



    

end


