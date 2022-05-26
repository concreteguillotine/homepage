require "rails_helper"

RSpec.feature "Admins can delete tickets" do
    let(:admin) { FactoryBot.create(:admin) }
    let(:article) { FactoryBot.create(:article) }

    scenario "successfully" do
        login_as(admin)
        visit article_path(article)

        within(".comments") do
            fill_in "Name", with: "Joe Cool"
            fill_in "Text", with: "I have commented."
            click_button "Create Comment"
            expect(page).to have_content "Joe Cool"   
            click_button "Delete Comment"
        end

        expect(page.current_url).to eq article_url(article)
        expect(page).to have_content "Comment has been deleted."
        expect(page).not_to have_content "Joe Cool"   
    end
end
