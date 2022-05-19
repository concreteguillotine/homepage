class Admin::ArticlesController < Admin::ApplicationController

  def new
    @article = Article.new
  end

  def create
      @article = Article.new(article_params)
      @article.author = current_admin

      if @article.save
          flash[:notice] = "Article has been uploaded!"
          redirect_to @article
      else

      end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash[:notice] = "Article has been updated."
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    flash[:notice] = "Article has been deleted."
    redirect_to articles_path
  end

  private

  def article_params
      params.require(:article).permit(:title, :description, :attachment)
  end
end
