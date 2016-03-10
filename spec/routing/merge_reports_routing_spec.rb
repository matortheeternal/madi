require "rails_helper"

RSpec.describe MergeReportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/merge_reports").to route_to("merge_reports#index")
    end

    it "routes to #new" do
      expect(:get => "/merge_reports/new").to route_to("merge_reports#new")
    end

    it "routes to #show" do
      expect(:get => "/merge_reports/1").to route_to("merge_reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/merge_reports/1/edit").to route_to("merge_reports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/merge_reports").to route_to("merge_reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/merge_reports/1").to route_to("merge_reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/merge_reports/1").to route_to("merge_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/merge_reports/1").to route_to("merge_reports#destroy", :id => "1")
    end

  end
end
