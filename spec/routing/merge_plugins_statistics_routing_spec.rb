require "rails_helper"

RSpec.describe MergePluginsStatisticsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/merge_plugins_statistics").to route_to("merge_plugins_statistics#index")
    end

    it "routes to #new" do
      expect(:get => "/merge_plugins_statistics/new").to route_to("merge_plugins_statistics#new")
    end

    it "routes to #show" do
      expect(:get => "/merge_plugins_statistics/1").to route_to("merge_plugins_statistics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/merge_plugins_statistics/1/edit").to route_to("merge_plugins_statistics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/merge_plugins_statistics").to route_to("merge_plugins_statistics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/merge_plugins_statistics/1").to route_to("merge_plugins_statistics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/merge_plugins_statistics/1").to route_to("merge_plugins_statistics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/merge_plugins_statistics/1").to route_to("merge_plugins_statistics#destroy", :id => "1")
    end

  end
end
