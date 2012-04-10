class CommentsController < ApplicationController
  before_filter :require_user, :load_post
  
  def create
    @comment = Comment.build_from( @post, current_user.id, params[:comment][:body] )
    if @comment.save
      redirect_to post_url(@post)
    else
      flash[:error] = "Can't save your comment"
      redirect_to post_url(@post)
    end
  end
  
  def update
  end
  
  def delete
  end
  
  private
  
  def load_post
    @post = Post.find(params[:comment][:commentable])
  end
end
