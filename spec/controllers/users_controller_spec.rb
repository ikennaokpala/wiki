require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    subject { get :new }

    it "gives a http success status" do
      expect(response).to have_http_status(:success)
    end

    it "renders the new templates" do
      expect(subject).to render_template("users/new")
    end
  end

  describe "POST #create" do
    it "creates a new account" do
      params = { username: "c_user", email: "c@d.com", password: "temp" }
      user = build(:user, params)

      expect(User).to receive(:create).with(params).and_return(user)

      post :create, params: params

      expect(response).to redirect_to(new_user_path)
    end
  end
end
