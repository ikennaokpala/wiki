require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    subject { get :new }

    it "gives a http success status" do
      expect(response).to have_http_status(:success)
    end

    it "renders the new templates" do
      expect(subject).to render_template("sessions/new")
    end
  end

  describe "POST #create" do
    let(:user){ create(:user, id: 100, username: "c_user", password: "temp") }
    let(:params) { { username: user.username, password: user.password } }

    context "when username and password are incorrect" do
      before do
        post :create, params: { username: "wrong", password: "wrong" }
      end

      it "redirects to new session path" do
        expect(response).to redirect_to(new_session_path)
      end

      it "sets not logged in flash notice" do
        expect(flash[:notice]).to eq("Not Logged in!")
      end

      it "sets session user_id to nil" do
        expect(session[:user_id]).to eq(nil)
      end
    end

    context "when username and password are correct" do
      before do
        post :create, params: params
      end

      it "redirects to articles path" do
        expect(response).to redirect_to(articles_path)
      end

      it "sets logged in flash notice" do
        expect(flash[:notice]).to eq("Logged in!")
      end

      it "sets session user_id to authenticated user's id" do
        expect(session[:user_id]).to eq(user.id)
      end
    end
  end
end
