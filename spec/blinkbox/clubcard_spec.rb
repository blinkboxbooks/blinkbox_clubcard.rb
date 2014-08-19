require_relative '../spec_helper'

shared_examples "a randomly creatable Clubcard" do
  it "should be able to generate a clubcard number" do
    expect(described_class.generate_random_number).to match(/\d{#{described_class::LENGTH}}/)
  end

  it "should be able to generate a clubcard number on the parent class" do
    expect(Blinkbox::Clubcard.generate_random_number(type: described_class)).to match(/\d{#{described_class::LENGTH}}/)
  end

  it "should be able to generate a clubcard randomly" do
    expect(described_class.create_random_clubcard).to be_instance_of(described_class)
  end

  it "should be able to generate a clubcard normally on the parent class" do
    expect(Blinkbox::Clubcard.create_random_clubcard(type: described_class)).to be_instance_of(described_class)
  end
end

shared_examples "a Clubcard" do
  before(:each) do
    @clubcard = described_class.create_random_clubcard
  end

  it "should have a number" do
    expect(@clubcard).to respond_to(:number)
  end

  it "should have a type" do
    expect(@clubcard).to respond_to(:type)
  end
end

describe Blinkbox::Clubcard do
  it_behaves_like "a Clubcard"

  it "should create a random UK Clubcard by default" do
    expect(Blinkbox::Clubcard.create_random_clubcard).to be_instance_of(Blinkbox::Clubcard::UK)
  end

  it "should generate a random UK Clubcard number by default" do
    cc_num = Blinkbox::Clubcard.generate_random_number
    expect { Blinkbox::Clubcard::UK.new(cc_num) }.not_to raise_error
  end
end

describe Blinkbox::Clubcard::UK do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::UKPrivilege do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::UKStudent do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::Ireland do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::IrelandPrivilege do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::ROI do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::UKROITPF do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::UKTPF do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::ROIStaffDiscount do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::StaffDiscount do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::Plus do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end

describe Blinkbox::Clubcard::Charity do
  it_behaves_like "a Clubcard"
  it_behaves_like "a randomly creatable Clubcard"
end
