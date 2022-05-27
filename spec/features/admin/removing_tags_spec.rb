require "rails_helper"

RSpec.feature "admins can remove tags from articles" do
    let(:admin) { FactoryBot.create(:admin) }
    let(:article) do
        FactoryBot.create(:article,
            author: admin,
            tags: [FactoryBot.create(:tag, name: "Delete please")]
        )
    end

    before do
        login_as(admin)
        visit article_path(article)
    end

    scenario "successfully", js: true do
        within tag("Delete please") do
            click_link "Remove tag"
        end
        expect(page).to_not have_content "Delete please"
    end
end