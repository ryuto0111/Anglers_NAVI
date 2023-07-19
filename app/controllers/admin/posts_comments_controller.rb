class Admin::PostsCommentsController < ApplicationController

  def destroy
    @post = Post.find(params[:post_id])
    @comment = PostComment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to request.referer
  end
end
