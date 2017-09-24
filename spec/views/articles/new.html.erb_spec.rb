require "rails_helper"

RSpec.describe "articles/new.html.erb", type: :view do
  it "renders a form for creating an articles" do
    assign(:programming_languages, create_list(:programming_language, 2))
    expected_form = "form[action='/articles'][accept-charset=UTF-8][method=post]"
    render

    expect(rendered).to have_selector(expected_form)
    expect(rendered).to have_field("Title")
    expect(rendered).to have_field("Content")
    expect(rendered).to have_field("Programming Language")
    expect(rendered).to have_button("Create Article")
  end
end
