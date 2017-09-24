class AddProgrammingLanguageToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :programming_language, foreign_key: true, index: true
  end
end
