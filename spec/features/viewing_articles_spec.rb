require "rails_helper"

RSpec.feature "Users can view articles" do
    scenario "with the article details" do
        article = FactoryBot.create(:article, title: "Test Article")

        visit "/"
        click_link "Test Article"
        expect(page.current_url).to eq article_url(article)
    end
end