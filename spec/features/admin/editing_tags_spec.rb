require "rails_helper"

RSpec.feature "admins can edit existing articles" do
    let!(:admin) { FactoryBot.create(:admin) }
    let(:article) { FactoryBot.create(:article, title: "Browser Testing Tutorial")}

    before do
        login_as(admin)
        visit article_path(article)
    end

    context "when the article has tags" do
        before do
            article.tags << FactoryBot.create(:tag, name: "Visual testing")
            article.tags << FactoryBot.create(:tag, name: "Browser")
        end

        it "sees existing tags on edit form" do
            click_link "Edit Article"
            within(".tags") do
                expect(page).to have_content("Visual testing")
                expect(page).to have_content("Browser")
            end
        end

        it "can add new tags to a ticket" do
            click_link "Edit Article"
            fill_in "Tags", with: "regression, bug"
            click_button "Update Article"
            expect(page).to have_content("Article has been updated.")

            within(".article .attributes .tags") do
                expect(page).to have_content("Visual testing")
                expect(page).to have_content("Browser")
                expect(page).to have_content("regression")
                expect(page).to have_content("bug")
            end
        end
    end     
end