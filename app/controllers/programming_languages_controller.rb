class ProgrammingLanguagesController < ApplicationController
  def new; end

  def create
    ProgrammingLanguage.create(programming_language_params.to_h)
    redirect_to new_programming_language_path
  end

private

  def programming_language_params
    params.permit(:name)
  end
end
