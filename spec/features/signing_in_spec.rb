require "rails_helper"

RSpec.feature "admins can sign in" do
    let!(:admin) { FactoryBot.create(:admin) }

    scenario "with valid credentials" do

        visit "/admins/sign_in"
        fill_in "Email", with: admin.email
        fill_in "Password", with: "password"
        click_button "Log in"

        expect(page).to have_content "Signed in successfully."
        expect(page).to have_content "Hello Seth :)"
    end
end