class TagsController < ApplicationController
  include TagsHelper
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])    
    @tag.destroy

    redirect_to tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update_attributes(tag_params)
    
    flash.notice = "Tag has updated!"
    redirect_to tags_path
  end

end
