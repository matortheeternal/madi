require 'rails_helper'

RSpec.describe "MergePluginsStatistics", type: :request do
  describe "GET /merge_plugins_statistics" do
    it "works! (now write some real specs)" do
      get merge_plugins_statistics_path
      expect(response).to have_http_status(200)
    end
  end
end
