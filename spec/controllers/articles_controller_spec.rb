require "rails_helper"

RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    it "gives a http success status" do
      expect(response).to have_http_status(:success)
    end

    it "assigns list of articles" do
      articles = create_list(:article, 2)

      get :index

      expect(assigns(:articles)).to match_array(articles)
    end

    it "renders the article's new template" do
      expect(subject).to render_template("articles/index")
    end
  end

  describe "GET #new" do
    subject { get :new }

    it "gives a http success status" do
      expect(response).to have_http_status(:success)
    end

    it "renders the article's new template" do
      expect(subject).to render_template("articles/new")
    end
  end

  describe "POST #create" do
    it "creates a new article" do
      params = { title: "Article Title", body: "Article Content" }
      article = build(:article, params)

      expect(Article).to receive(:create).with(params).and_return(article)

      post :create, params: params

      expect(response).to redirect_to(new_article_path)
    end
  end
end
