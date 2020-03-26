require 'rails_helper'

RSpec.describe Mermaid, type: :model do
  it "should validate name" do
    mermaid = Mermaid.create
    expect(mermaid.errors[:name]).to_not be_empty
  end
  it "should validate age" do
    mermaid = Mermaid.create
    expect(mermaid.errors[:age]).to_not be_empty
  end
  it "should validate enjoys" do
    mermaid = Mermaid.create
    expect(mermaid.errors[:enjoys]).to_not be_empty
  end
end
