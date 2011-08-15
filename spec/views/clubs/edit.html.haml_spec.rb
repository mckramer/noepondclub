require 'spec_helper'

describe "clubs/edit.html.haml" do
  before(:each) do
    @club = assign(:club, stub_model(Club,
      :name => "MyString",
      :address => "MyString",
      :diving => false,
      :paddle => false,
      :swimming => false,
      :tennis => false
    ))
  end

  it "renders the edit club form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clubs_path(@club), :method => "post" do
      assert_select "input#club_name", :name => "club[name]"
      assert_select "input#club_address", :name => "club[address]"
      assert_select "input#club_diving", :name => "club[diving]"
      assert_select "input#club_paddle", :name => "club[paddle]"
      assert_select "input#club_swimming", :name => "club[swimming]"
      assert_select "input#club_tennis", :name => "club[tennis]"
    end
  end
end
