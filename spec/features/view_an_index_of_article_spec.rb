require "rails_helper"

RSpec.feature "Article listing", type: :feature do
  scenario "A visitor can view an index of articles" do
    article = create_list(:article, 2)

    visit articles_path

    expect(page).to have_content "Index of Articles"
    expect(page).to have_selector("ul li", count: 2)
  end
end
