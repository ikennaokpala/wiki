require "rails_helper"

RSpec.feature "Article creation", type: :feature do
  scenario "A visitor can create an article" do
    create(:programming_language, name: "Ruby")
    article = create(:article, title: "Feature Title")
    exempted = { except: [:id, :created_at, :updated_at] }

    visit new_article_path

    expect(page).to have_content "Add an Article"

    fill_in :title, with: article[:title]
    fill_in :body, with: article[:body]
    select("Ruby", from: "Programming Language:")
    click_button "Create Article"

    created_article = Article.first.as_json(exempted)
    expected_article = article.as_json(exempted)

    expect(created_article).to eq expected_article
  end
end
