require 'rails_helper'

RSpec.describe "SmashSettings", type: :request do
  describe "GET /smash_settings" do
    it "works! (now write some real specs)" do
      get smash_settings_path
      expect(response).to have_http_status(200)
    end
  end
end
