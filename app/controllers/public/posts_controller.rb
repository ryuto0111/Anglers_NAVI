class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @tags = Tag.pluck(:name, :id)
  end

  def new
    @post = Post.new
    @tags = Tag.pluck(:name, :id)
  end

  def create
    @post = Post.new(post_params)
    @tags = Tag.pluck(:name, :id)
    if @post.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.pluck(:name, :id)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました。"
      redirect_to post_path(@post)
    else
      @tags = Tag.pluck(:name, :id)
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, tag_ids: [], post_images: [])
  end

end
