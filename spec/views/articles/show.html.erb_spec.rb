require "rails_helper"

RSpec.describe "articles/show.html.erb", type: :view do
  it "renders a form for creating an articles" do
    assign(:article, build(:article))
    render

    expect(rendered).to have_selector("h1")
    expect(rendered).to have_selector("p")
  end
end
