require "rails_helper"

RSpec.describe "sessions/new.html.erb", type: :view do
  it "renders a login form" do
    expected_form = "form[action='/sessions'][accept-charset=UTF-8][method=post]"
    render

    expect(rendered).to have_selector(expected_form)
    expect(rendered).to have_field("Username")
    expect(rendered).to have_field("Password")
    expect(rendered).to have_button("Sign in")
    expect(rendered).to have_link("Forgot password")
  end
end
