require 'rails_helper'

RSpec.describe "Interventions", type: :request do
  
  describe "GET #getbatteries" do
        context "verifies that the buildings function in the intervention controller works correctly" do
          it "creates a Widget" do
            headers = { "ACCEPT" => "text/html" }
            post '/interventions/getbatteries', :params => { :widget => {:name => "My Widget"} }, :headers => headers
        
            expect(response.content_type).to eq("text/html")
            
          end
        end
            
    end
    
  
end
