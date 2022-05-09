require "rails_helper"

RSpec.feature "user can upload text documents" do
    scenario "with article details and an attachment" do

        visit "/"

        click_link "Upload Article"
        fill_in "Name", with: "First Program Tutorial"
        fill_in "Description", with: "A short tutorial on our first program"
        attach_file "File", "spec/fixtures/speed.txt"
        click_button "Create Article"

        expect(page).to have_content "Article has been uploaded!"

        within(".article .attachment") do
            expect(page).to have_content "speed.txt"
        end
    end
end