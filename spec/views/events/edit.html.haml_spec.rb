require 'spec_helper'

describe "events/edit.html.haml" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :title => "MyString",
      :allday => false,
      :where => "MyString",
      :description => "MyText",
      :category => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_title", :name => "event[title]"
      assert_select "input#event_allday", :name => "event[allday]"
      assert_select "input#event_where", :name => "event[where]"
      assert_select "textarea#event_description", :name => "event[description]"
      assert_select "input#event_category", :name => "event[category]"
    end
  end
end
