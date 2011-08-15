require 'spec_helper'

describe "clubs/index.html.haml" do
  before(:each) do
    assign(:clubs, [
      stub_model(Club,
        :name => "Name",
        :address => "Address",
        :diving => false,
        :paddle => false,
        :swimming => false,
        :tennis => false
      ),
      stub_model(Club,
        :name => "Name",
        :address => "Address",
        :diving => false,
        :paddle => false,
        :swimming => false,
        :tennis => false
      )
    ])
  end

  it "renders a list of clubs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
