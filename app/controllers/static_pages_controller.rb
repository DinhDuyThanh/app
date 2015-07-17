class StaticPagesController < ApplicationController
  def home
    @entry = current_user.entries.build if logged_in?
     @comment = Comment.new if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page])  if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
