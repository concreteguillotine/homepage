class Admin::TagsController < Admin::ApplicationController
    def remove
        @article = Article.find(params[:article_id])
        @tag = Tag.find(params[:id])

        @article.tags.destroy(@tag)
        redirect_to edit_admin_article_path(@article)
    end
end
