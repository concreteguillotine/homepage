class Admin::CommentsController < Admin::ApplicationController
    before_action :set_article, only: [:destroy]

    def destroy
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        flash[:notice] = "Comment has been deleted."

        redirect_to @article
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:text, :name)
    end
end


