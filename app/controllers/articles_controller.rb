class ArticlesController < ApplicationController
    before_action :set_article, only: %i(show)

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @comment = @article.comments.build
    end

    private

    def set_article
        @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The article you were looking for could not be found."
        redirect_to articles_path
    end

    def article_params
        params.require(:article).permit(:title, :description, :attachment)
    end
end