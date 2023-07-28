class Admin::PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(6)
    @tags = Tag.where(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @tags = Tag.pluck(:name, :id)
    @index_tags = Tag.where(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to admin_posts_path
  end

  def search
    @tags = Tag.where(params[:id])
    if params[:keyword].present?
      @posts = Post.where('body LIKE ?', "%#{params[:keyword]}%").page(params[:page]).per(6)
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

end
