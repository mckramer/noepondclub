require 'spec_helper'

describe "independents/show.html.haml" do
  before(:each) do
    @independent = assign(:independent, stub_model(Independent,
      :name_first => "Name First",
      :name_middle => "Name Middle",
      :name_last => "Name Last",
      :name_suffix => "Name Suffix",
      :email => "Email",
      :phone => "Phone",
      :member => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name First/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Middle/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Last/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Suffix/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
