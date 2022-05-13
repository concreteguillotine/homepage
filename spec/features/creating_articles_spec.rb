require "rails_helper"

RSpec.feature "user can upload text documents" do
    let(:admin) { FactoryBot.create(:admin) }

    before do
        login_as(admin)
        visit "/"
    end

    scenario "with article details and an attachment" do

        click_link "Upload Article"
        fill_in "Title", with: "First Program Tutorial"
        fill_in "Description", with: "A short tutorial on our first program"
        attach_file "File", "spec/fixtures/speed.txt"
        click_button "Create Article"

        expect(page).to have_content "Article has been uploaded!"

        within(".article") do
            expect(page).to have_content "#{admin.email}"
            expect(page).to have_content "Uploaded on:"
        end

        within(".article .attachment") do
            expect(page).to have_content "speed.txt"
        end
    end
end