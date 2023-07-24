class Admin::TagsController < ApplicationController

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render:index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update
      flash[:notice] = "情報が更新されました"
    else
      render :edit
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
