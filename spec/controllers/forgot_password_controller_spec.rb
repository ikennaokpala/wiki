require "rails_helper"

RSpec.describe ForgotPasswordController, type: :controller do
  describe "GET #new" do
    subject { get :new }

    it "gives a http success status" do
      expect(response).to have_http_status(:success)
    end

    it "renders the new templates" do
      expect(subject).to render_template("forgot_password/new")
    end
  end

  describe "POST #create" do
    let(:user) { create(:user, username: "c_user") }
    let(:params) { { username: user[:username] } }

    context "when user exists" do
      it "sends reset email and redirects to forgot password form" do
        expect(EmailJob).to receive_message_chain(:set, :perform_later)

        post :create, params: params
        
        expect(response).to redirect_to(new_forgot_password_path(params))
      end
    end

    context "when user does not exists" do
      it "only redirects to forgot password form" do
        post :create, params: { username: "wrong" }
        expect(response).to redirect_to(new_forgot_password_path)
      end
    end
  end
end
