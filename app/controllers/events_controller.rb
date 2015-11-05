class EventsController < ApplicationController
    def index
      if current_user
        @user = current_user
        @events = @user.events.all
        @tags = Tag.all

        # binding.pry
      end
    end

    def show
      @user = current_user
      @event = Event.find(params[:id])
      @tags = Tag.all
      respond_to do |format|
        format.html { redirect_to user_event_path(@event) }
        format.js
      end
    end

    def new
      @user = current_user
      @event = Event.new
    end

    def create
      @user = current_user
      @event = @user.events.new(event_params)
      if @event.save
        flash[:notice] = "your event has been created"
        respond_to do |format|
          format.html { }
          format.js
        end
      else
        render 'new'
      end
    end

   private

    def event_params
      params.require(:event).permit(:title, :short_description, :long_description, :address, :date, :user_id)
    end

end
