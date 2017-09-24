require "rails_helper"

RSpec.describe "articles/index.html.erb", type: :view do
  it "renders a list of articles" do
    assign(:articles, create_list(:article, 2))

    render

    expect(rendered).to have_selector("ul li", count: 2)
  end
end
