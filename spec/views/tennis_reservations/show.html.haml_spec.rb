require 'spec_helper'

describe "tennis_reservations/show.html.haml" do
  before(:each) do
    @tennis_reservation = assign(:tennis_reservation, stub_model(TennisReservation,
      :member => nil,
      :start_at => 1,
      :end_at => 1,
      :court => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
