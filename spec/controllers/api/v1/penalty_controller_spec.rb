require "rails_helper"

RSpec.describe Api::V1::Penalty::PenaltyController, type: :controller do

  describe "#create" do
    it "returns proper status" do
      post :create
      expect(response.status).to eql 201
    end

    it "returns proper body keys" do
      post :create
      expect(json_body.keys).to eql ["id", "start_role", "current_role", "score", "winner"]
    end
  end

end
