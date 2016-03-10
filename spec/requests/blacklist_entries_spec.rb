require 'rails_helper'

RSpec.describe "BlacklistEntries", type: :request do
  describe "GET /blacklist_entries" do
    it "works! (now write some real specs)" do
      get blacklist_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
