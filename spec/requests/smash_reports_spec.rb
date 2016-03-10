require 'rails_helper'

RSpec.describe "SmashReports", type: :request do
  describe "GET /smash_reports" do
    it "works! (now write some real specs)" do
      get smash_reports_path
      expect(response).to have_http_status(200)
    end
  end
end
