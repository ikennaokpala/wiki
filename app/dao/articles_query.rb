class ArticlesQuery
  def initialize(params)
    @params = params
  end

  def get
    Article.all
      .where(query_string)
  end

protected

  def query_string
    query_strings = [
      title_query_string,
      programming_language_query_string
    ]
    query_strings.compact.join(" AND ")
  end

  def title_query_string
    "title LIKE '%#{@params[:title]}%'" if @params[:title].present?
  end

  def programming_language_query_string
    "programming_language_id = #{@params[:programming_language_id]}" if @params[:programming_language_id].present?
  end
end
