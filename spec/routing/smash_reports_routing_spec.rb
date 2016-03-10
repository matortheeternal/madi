require "rails_helper"

RSpec.describe SmashReportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/smash_reports").to route_to("smash_reports#index")
    end

    it "routes to #new" do
      expect(:get => "/smash_reports/new").to route_to("smash_reports#new")
    end

    it "routes to #show" do
      expect(:get => "/smash_reports/1").to route_to("smash_reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/smash_reports/1/edit").to route_to("smash_reports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/smash_reports").to route_to("smash_reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/smash_reports/1").to route_to("smash_reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/smash_reports/1").to route_to("smash_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/smash_reports/1").to route_to("smash_reports#destroy", :id => "1")
    end

  end
end
