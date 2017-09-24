require "rails_helper"

RSpec.describe "programming_languages/new.html.erb", type: :view do
  it "renders a form for creating an programming language" do
    expected_form = "form[action='/programming_languages'][accept-charset=UTF-8][method=post]"
    render

    expect(rendered).to have_selector(expected_form)
    expect(rendered).to have_field("Name")
    expect(rendered).to have_button("Create Programming Language")
  end
end
