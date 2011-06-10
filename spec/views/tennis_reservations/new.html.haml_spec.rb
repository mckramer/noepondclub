require 'spec_helper'

describe "tennis_reservations/new.html.haml" do
  before(:each) do
    assign(:tennis_reservation, stub_model(TennisReservation,
      :member => nil,
      :start_at => 1,
      :end_at => 1,
      :court => 1
    ).as_new_record)
  end

  it "renders new tennis_reservation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tennis_reservations_path, :method => "post" do
      assert_select "input#tennis_reservation_member", :name => "tennis_reservation[member]"
      assert_select "input#tennis_reservation_start_at", :name => "tennis_reservation[start_at]"
      assert_select "input#tennis_reservation_end_at", :name => "tennis_reservation[end_at]"
      assert_select "input#tennis_reservation_court", :name => "tennis_reservation[court]"
    end
  end
end
