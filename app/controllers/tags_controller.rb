class TagsController < ApplicationController
    def remove
        @article = Article.find(params[:article_id])
        @tag = Tag.find(params[:id])

        @article.tags.destroy(@tag)
        redirect_to @article
    end
end
