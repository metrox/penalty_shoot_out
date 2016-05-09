require "rails_helper"

describe ListSessionService do
  subject { ListSessionService }

  before(:all) do
    List = Struct.new(:id, :role)
    @session = List.new(1)
  end

  it "check #add" do
    subject.add @session
    expect(subject.list).to eq [@session]
  end

  it "check #last_id" do
    expect(subject.last_id).to eq 1
  end

end
