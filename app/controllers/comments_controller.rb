class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
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
