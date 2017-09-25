require "rails_helper"

RSpec.feature "View Article", type: :feature do
  scenario "A visitor can view an article" do
    article = create(:article)

    visit article_path(id: article.id)

    expect(page).to have_selector("h1", count: 1)
    expect(page).to have_selector("p", count: 1)
  end
end
