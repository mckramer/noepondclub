require 'spec_helper'

describe "tennis_reservations/index.html.haml" do
  before(:each) do
    assign(:tennis_reservations, [
      stub_model(TennisReservation,
        :member => nil,
        :start_at => 1,
        :end_at => 1,
        :court => 1
      ),
      stub_model(TennisReservation,
        :member => nil,
        :start_at => 1,
        :end_at => 1,
        :court => 1
      )
    ])
  end

  it "renders a list of tennis_reservations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
