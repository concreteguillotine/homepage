require 'rails_helper'

RSpec.describe "/admin", type: :request do
  describe "GET /" do
    let(:admin) { FactoryBot.create(:admin) }

    context "when not signed in as admin" do
      it "redirects away" do
      get "/admin"
      expect(response).to have_http_status(302)
      end
    end

    context "when signed in as an admin" do
      before do
        login_as(admin)
      end

      it "lets the admin in" do
        get "/admin"
        expect(response).to have_http_status(:success)
      end
    end
  end
end