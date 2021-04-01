require 'rails_helper'

RSpec.describe Quote, type: :model do
  subject {
    described_class.new(quotes_email: 'gh',
                        building_type: 'gh',
                        building_type: "fhg")
  }

  it "is not valid without a title" do
    subject.building_type = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a title" do
    subject.unit_price = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a title" do
    subject.product_line = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.quotes_email = nil
    expect(subject).to_not be_valid
  end

end
