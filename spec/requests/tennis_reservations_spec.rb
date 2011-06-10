require 'spec_helper'

describe "TennisReservations" do
  describe "GET /tennis_reservations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get tennis_reservations_path
      response.status.should be(200)
    end
  end
end
