require 'spec_helper'

describe "tennis_reservations/edit.html.haml" do
  before(:each) do
    @tennis_reservation = assign(:tennis_reservation, stub_model(TennisReservation,
      :member => nil,
      :start_at => 1,
      :end_at => 1,
      :court => 1
    ))
  end

  it "renders the edit tennis_reservation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tennis_reservations_path(@tennis_reservation), :method => "post" do
      assert_select "input#tennis_reservation_member", :name => "tennis_reservation[member]"
      assert_select "input#tennis_reservation_start_at", :name => "tennis_reservation[start_at]"
      assert_select "input#tennis_reservation_end_at", :name => "tennis_reservation[end_at]"
      assert_select "input#tennis_reservation_court", :name => "tennis_reservation[court]"
    end
  end
end
