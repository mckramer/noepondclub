require 'spec_helper'

describe "independents/index.html.haml" do
  before(:each) do
    assign(:independents, [
      stub_model(Independent,
        :name_first => "Name First",
        :name_middle => "Name Middle",
        :name_last => "Name Last",
        :name_suffix => "Name Suffix",
        :email => "Email",
        :phone => "Phone",
        :member => nil
      ),
      stub_model(Independent,
        :name_first => "Name First",
        :name_middle => "Name Middle",
        :name_last => "Name Last",
        :name_suffix => "Name Suffix",
        :email => "Email",
        :phone => "Phone",
        :member => nil
      )
    ])
  end

  it "renders a list of independents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name First".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Middle".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Last".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Suffix".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
