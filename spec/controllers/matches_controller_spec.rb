require "spec_helper"
describe MatchesController do
  describe "GET show" do
    before(:each) do
    get :show
  end
    it "should respond with 200 status" do
      response.status.should eq 200
    end

  end
end