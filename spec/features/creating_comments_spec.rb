require "rails_helper"

RSpec.feature "Viewers can leave comments on articles" do
    let(:article) { FactoryBot.create(:article) }

    scenario "with a name" do
        visit article_path(article)

        within(".comments") do
            fill_in "Name", with: "Joe Cool"
            fill_in "Text", with: "I have commented."
            click_button "Create Comment"
        end
        expect(page).to have_content "Comment has been created."

        within(".comments") do
            expect(page).to have_content "Joe Cool"
            expect(page).to have_content "I have commented."   
        end
    end

    scenario "without a name" do
        visit article_path(article)

        within(".comments") do
            fill_in "Text", with: "Comment planted."
            click_button "Create Comment"
        end
        expect(page).to have_content "Comment has been created."

        within(".comments") do
            expect(page).to have_content "Anonymous"
            expect(page).to have_content "Comment planted."   
        end
    end
end