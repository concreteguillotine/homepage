require "rails_helper"

RSpec.feature "admins can edit existing articles" do
    let!(:admin) { FactoryBot.create(:admin) }

    before do
        login_as(admin)
    end

    scenario "with valid attributes" do
        FactoryBot.create(:article, title: "VSC")

        visit "/"
        click_link "VSC"
        click_link "Edit Article"
        fill_in "Title", with: "VS Code"
        click_button "Update Article"

        expect(page).to have_content "Article has been updated."
        expect(page).to have_content "VS Code"
    end
end

