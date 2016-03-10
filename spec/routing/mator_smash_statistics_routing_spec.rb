require "rails_helper"

RSpec.describe MatorSmashStatisticsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mator_smash_statistics").to route_to("mator_smash_statistics#index")
    end

    it "routes to #new" do
      expect(:get => "/mator_smash_statistics/new").to route_to("mator_smash_statistics#new")
    end

    it "routes to #show" do
      expect(:get => "/mator_smash_statistics/1").to route_to("mator_smash_statistics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mator_smash_statistics/1/edit").to route_to("mator_smash_statistics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mator_smash_statistics").to route_to("mator_smash_statistics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mator_smash_statistics/1").to route_to("mator_smash_statistics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mator_smash_statistics/1").to route_to("mator_smash_statistics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mator_smash_statistics/1").to route_to("mator_smash_statistics#destroy", :id => "1")
    end

  end
end
