require "rails_helper"

RSpec.feature "Login", type: :feature do
  scenario "A visitor can login with appropriate details and become an authenticated visitor" do
    user = create(:user, id: 100, username: "visitor", password: "v_pass")

    visit new_session_path

    expect(page).to have_selector("h1", text: "Login")
    expect(page).to have_selector("label", text: "Username")
    expect(page).to have_selector("input", id: "username")
    expect(page).to have_selector("label", text: "Password")
    expect(page).to have_selector("input", id: "password")
    expect(page).to have_selector("input[type=submit][value='Sign in']")

    fill_in :username, with: user[:username]
    fill_in :password, with: user[:password]
    click_button "Sign in"

    expect(current_path).to eq articles_path
    expect(page).to have_selector("div.notice", text: "Logged in!")
    expect(page).to have_content "Index of Articles"
    expect(page).to have_selector("ul", count: 1)
  end
end
