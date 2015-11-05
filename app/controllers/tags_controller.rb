class TagsController < ApplicationController
  def index
    @tags = Tag.all

  end

  def show
    @tag = Tag.find(params[:id])
    @events = @tag.events.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.event_id = 0
    if @tag.save
      flash[:alert] = "Your tag was created."
      redirect_to  root_path
    else
      render :new
    end
  end

    # @post.tags.push(@tag)
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Your tag was deleted"
    redirect_to root_path
  end

  private

    def tag_params
      params.require(:tag).permit(:name)
    end

end
