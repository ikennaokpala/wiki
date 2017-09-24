require "rails_helper"

RSpec.describe ProgrammingLanguagesController, type: :controller do
  describe "GET #new" do
    subject { get :new }

    it "gives a http success status" do
      expect(response).to have_http_status(:success)
    end

    it "renders the programming language new templates" do
      expect(subject).to render_template("programming_languages/new")
    end
  end

  describe "POST #create" do
    it "creates a new programming language" do
      params = { name: "Ruby" }
      programming_language = build(:programming_language, params)

      expect(ProgrammingLanguage).to receive(:create).with(params)
        .and_return(programming_language)

      post :create, params: params

      expect(response).to redirect_to(new_programming_language_path)
    end
  end
end
