require "spec_helper"

describe TennisReservationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tennis_reservations" }.should route_to(:controller => "tennis_reservations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tennis_reservations/new" }.should route_to(:controller => "tennis_reservations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tennis_reservations/1" }.should route_to(:controller => "tennis_reservations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tennis_reservations/1/edit" }.should route_to(:controller => "tennis_reservations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tennis_reservations" }.should route_to(:controller => "tennis_reservations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tennis_reservations/1" }.should route_to(:controller => "tennis_reservations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tennis_reservations/1" }.should route_to(:controller => "tennis_reservations", :action => "destroy", :id => "1")
    end

  end
end
