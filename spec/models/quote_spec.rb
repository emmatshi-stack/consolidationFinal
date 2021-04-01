require 'rails_helper'

RSpec.describe Quote, type: :model do
  subject {
    described_class.new(quotes_email: 'gh',
                        unit_price:12345,
                        building_type: "fhg")
  }

  it "is not valid without a building_type" do
    subject.building_type = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a unit_price" do
    subject.unit_price = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a quotes_email" do
    subject.quotes_email = nil
    expect(subject).to_not be_valid
  end

end
