require "rails_helper"

RSpec.describe "forgot_password/new.html.erb", type: :view do
  it "renders a forgot password reset form" do
    expected_form = "form[action='/users/forgot_password'][accept-charset=UTF-8][method=post]"
    render

    expect(rendered).to have_selector(expected_form)
    expect(rendered).to have_field("Username:")
    expect(rendered).to have_button("Reset")
  end
end
