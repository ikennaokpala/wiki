require "rails_helper"

RSpec.describe ArticlesQuery do
  let(:programming_languages) do
    [
      create(:programming_language, id: 100),
      create(:programming_language, id: 101)
    ]
  end
  let(:articles) do
    [
      create(:article, title: "Good title", programming_language: programming_languages.first),
      create(:article, title: "Awesome thing", programming_language: programming_languages.last)
    ]
  end

  context "when supplied with params" do
    subject { ArticlesQuery.new({ title: "Good", programming_language_id: 100 }) }

    it "returns list of articles matching supplied params" do
      expect(subject.get).to match_array([articles.first])
    end
  end

  context "when supplied with only title param" do
    subject { ArticlesQuery.new({ title: "thing" }) }

    it "returns list of articles matching supplied params" do
      expect(subject.get).to match_array([articles.last])
    end
  end

  context "when supplied with only programming_language_id param" do
    subject { ArticlesQuery.new({ programming_language_id: 100 }) }

    it "returns list of articles matching supplied params" do
      expect(subject.get).to match_array([articles.first])
    end
  end

  context "when no params are supplied" do
    subject { ArticlesQuery.new({}) }

    it "returns list of articles matching supplied params" do
      expect(subject.get).to match_array(articles)
    end
  end
end
