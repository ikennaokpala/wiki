require "rails_helper"

RSpec.describe "articles/index.html.erb", type: :view do
  before do
    assign(:articles, create_list(:article, 2))
    assign(:programming_languages, build_list(:programming_language, 2))
  end

  it "renders a list of articles" do
    render

    expect(rendered).to have_selector("ul li", count: 2)
  end

  it "renders articles search form" do
    expected_form = "form[action='/articles'][accept-charset=UTF-8][method=get]"
    render

    expect(rendered).to have_selector(expected_form)
    expect(rendered).to have_selector("input[placeholder='Type article title']")
    expect(rendered).to have_selector("select option", count: 3)
    expect(rendered).to have_button("Search")
  end
end
