require_relative '../spec_helper'

describe Blinkbox::Clubcard do
  before(:each) do
    @clubcard = Blinkbox::Clubcard::UK.new(634004574734747165)
  end

  it "should return a UK Clubcard by default" do
    expect(described_class.create_random_clubcard).to be_instance_of(Blinkbox::Clubcard::UK)
  end
end

shared_examples "a Clubcard" do
  it "should have a number" do
    expect(@clubcard).to respond_to(:number)
  end

  it "should have a type" do
    expect(@clubcard).to respond_to(:type)
  end

  it "should be able to generate a UK Privilege clubcard" do
    expect(described_class.create_random_clubcard(type: Blinkbox::Clubcard::UKPrivilege)).to be_instance_of(Blinkbox::Clubcard::UKPrivilege)
  end

  it "should be able to generate a UK Student clubcard" do
    expect(described_class.create_random_clubcard(type: Blinkbox::Clubcard::UKStudent)).to be_instance_of(Blinkbox::Clubcard::UKStudent)
  end
end
