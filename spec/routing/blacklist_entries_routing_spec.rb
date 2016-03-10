require "rails_helper"

RSpec.describe BlacklistEntriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/blacklist_entries").to route_to("blacklist_entries#index")
    end

    it "routes to #new" do
      expect(:get => "/blacklist_entries/new").to route_to("blacklist_entries#new")
    end

    it "routes to #show" do
      expect(:get => "/blacklist_entries/1").to route_to("blacklist_entries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/blacklist_entries/1/edit").to route_to("blacklist_entries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/blacklist_entries").to route_to("blacklist_entries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/blacklist_entries/1").to route_to("blacklist_entries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/blacklist_entries/1").to route_to("blacklist_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/blacklist_entries/1").to route_to("blacklist_entries#destroy", :id => "1")
    end

  end
end
