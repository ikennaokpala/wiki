require "rails_helper"

RSpec.describe "users/new.html.erb", type: :view do
  it "renders a form for creating an account" do
    expected_form = "form[action='/users'][accept-charset=UTF-8][method=post]"
    render

    expect(rendered).to have_selector(expected_form)
    expect(rendered).to have_field("Username")
    expect(rendered).to have_field("E-mail")
    expect(rendered).to have_field("Password")
    expect(rendered).to have_button("Create Account")
  end
end
