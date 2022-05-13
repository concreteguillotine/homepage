class ArticlesController < ApplicationController

    def index
        @article = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            flash[:notice] = "Article has been uploaded!"
            redirect_to @article
        else

        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :description, :attachment)
    end
end
