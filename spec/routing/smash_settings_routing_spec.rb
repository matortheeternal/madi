require "rails_helper"

RSpec.describe SmashSettingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/smash_settings").to route_to("smash_settings#index")
    end

    it "routes to #new" do
      expect(:get => "/smash_settings/new").to route_to("smash_settings#new")
    end

    it "routes to #show" do
      expect(:get => "/smash_settings/1").to route_to("smash_settings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/smash_settings/1/edit").to route_to("smash_settings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/smash_settings").to route_to("smash_settings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/smash_settings/1").to route_to("smash_settings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/smash_settings/1").to route_to("smash_settings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/smash_settings/1").to route_to("smash_settings#destroy", :id => "1")
    end

  end
end
