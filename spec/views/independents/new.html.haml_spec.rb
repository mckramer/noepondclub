require 'spec_helper'

describe "independents/new.html.haml" do
  before(:each) do
    assign(:independent, stub_model(Independent,
      :name_first => "MyString",
      :name_middle => "MyString",
      :name_last => "MyString",
      :name_suffix => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :member => nil
    ).as_new_record)
  end

  it "renders new independent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => independents_path, :method => "post" do
      assert_select "input#independent_name_first", :name => "independent[name_first]"
      assert_select "input#independent_name_middle", :name => "independent[name_middle]"
      assert_select "input#independent_name_last", :name => "independent[name_last]"
      assert_select "input#independent_name_suffix", :name => "independent[name_suffix]"
      assert_select "input#independent_email", :name => "independent[email]"
      assert_select "input#independent_phone", :name => "independent[phone]"
      assert_select "input#independent_member", :name => "independent[member]"
    end
  end
end
