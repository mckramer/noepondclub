require "spec_helper"

describe IndependentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/independents" }.should route_to(:controller => "independents", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/independents/new" }.should route_to(:controller => "independents", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/independents/1" }.should route_to(:controller => "independents", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/independents/1/edit" }.should route_to(:controller => "independents", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/independents" }.should route_to(:controller => "independents", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/independents/1" }.should route_to(:controller => "independents", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/independents/1" }.should route_to(:controller => "independents", :action => "destroy", :id => "1")
    end

  end
end
