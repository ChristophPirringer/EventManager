class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @tag = @event.tags.new
  end

  def create
    @event = Event.find(params[:event_id])
    @tag = @event.tags.new(tag_params)
    @event.tags.push(@tag)
    if @tag.save
      flash[:alert] = "The tag has been created.!"
      redirect_to  event_path(@event)
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @tag = @event.tags.find(params[:id])
    @tag.destroy
    flash[:notice] = "The tag has been deleted."
    redirect_to event_path(@event)
  end

  private

    def tag_params
      params.require(:tag).permit(:name)
    end

end
