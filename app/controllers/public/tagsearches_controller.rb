class Public::TagsearchesController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

end
