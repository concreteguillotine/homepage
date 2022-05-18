require "rails_helper"

RSpec.feature "Admins can delete articles" do
    let(:admin) { FactoryBot.create(:admin) }
    FactoryBot.create(:article, title: "Test Article")

    before do
        login_as(admin)
        visit "/"
    end

    scenario "successfully" do

        click_link "Test Article"
        click_link "Delete Article"

        expect(page).to have_content "Article has been deleted."
        expect(page.current_url).to eq articles_url
        expect(page).to have_no_content "Test Article"
    end
end