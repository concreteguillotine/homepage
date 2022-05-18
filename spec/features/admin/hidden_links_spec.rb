require "rails_helper"

RSpec.feature "Only admins can see delete and edit article links" do
    let(:article) { FactoryBot.create(:article) }
    let!(:admin) { FactoryBot.create(:admin) }

    context "anonymous users" do
        scenario "cannot see the Edit Article link" do
            visit article_path(article)
            expect(page).not_to have_link "Edit Article"
        end

        scenario "cannot see the Delete Article link" do
            visit article_path(article)
            expect(page).not_to have_link "Delete Article"
        end
    end

    context "admins" do
        before { login_as(admin) }
        scenario "can see the Edit Article link" do
            visit article_path(article)
            expect(page).to have_link "Edit Article"
        end

        scenario "can see the Delete Article link" do
            visit article_path(article)
            expect(page).to have_link "Delete Article"
        end
    end
end