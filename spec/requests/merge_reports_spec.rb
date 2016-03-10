require 'rails_helper'

RSpec.describe "MergeReports", type: :request do
  describe "GET /merge_reports" do
    it "works! (now write some real specs)" do
      get merge_reports_path
      expect(response).to have_http_status(200)
    end
  end
end
