require "rails_helper"

RSpec.feature "Account creation", type: :feature do
  scenario "A visitor can create an account" do
    account = build(:user, username: "feature_user")
    exempted = { except: [:id, :created_at, :updated_at] }

    visit new_user_path

    expect(page).to have_content "Visitor Registeration"

    fill_in :username, with: account[:username]
    fill_in :email, with: account[:email]
    fill_in :password, with: account[:password]
    click_button "Create Account"

    created_account = User.first.as_json(exempted)
    expected_account = account.as_json(exempted)

    expect(created_account).to eq expected_account
  end
end
