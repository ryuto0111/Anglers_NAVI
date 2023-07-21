class Public::TagsearchesController < ApplicationController

  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.page(params[:page]).per(6)
  end

end
