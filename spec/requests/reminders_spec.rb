require 'rails_helper'

RSpec.describe "Reminders", type: :request do
  describe "GET /reminders" do
    it "works! (now write some real specs)" do
      get reminders_path
      expect(response).to have_http_status(200)
    end
  end
end
