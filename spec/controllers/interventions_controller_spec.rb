require 'rails_helper'
require 'json'

describe InterventionsController, type: :controller do
    # render_views
    describe "GET #getbuildings" do
        context "verifies that the buildings function in the intervention controller works correctly" do
            it "returns that the function works successfully" do
                params = {
                    "custormerid" => 1
                }
                get :getbuildings, params: params,  format: :json

                res = JSON.parse(response.body).first
                puts res
                p  res["id"]
                expect(res["id"]).to eq(1)
            end
        end    
    end
end