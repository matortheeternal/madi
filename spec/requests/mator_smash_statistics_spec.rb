require 'rails_helper'

RSpec.describe "MatorSmashStatistics", type: :request do
  describe "GET /mator_smash_statistics" do
    it "works! (now write some real specs)" do
      get mator_smash_statistics_path
      expect(response).to have_http_status(200)
    end
  end
end
