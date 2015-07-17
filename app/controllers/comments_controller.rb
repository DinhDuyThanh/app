class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
     @comment = Comment.new
  end
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.entry_id = params[:entry_id].to_i
    if @comment.save
    respond_to do |format|
      format.html { redirect_to @comment }
      format.js {render inline: "location.reload();" }
    end
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
