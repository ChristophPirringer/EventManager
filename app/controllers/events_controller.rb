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
      @thesetags = @event.tags.all
      # @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      #   marker.lat event.latitude
      #   marker.lng event.longitude
      # end
      respond_to do |format|
        format.html { redirect_to user_event_path(current_user, @event) }
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

    def update
      @user = current_user
      @event = Event.find(params[:id])
      @tags = Tag.all
      tags = params[:tags]
      tags.each do |tag|
        if !@event.tags.exists?(:id => tag)
          @event.tags.push(Tag.find(tag))
        end
      end
      redirect_to root_path
      # binding.pry

    end

   private

    def event_params
      params.require(:event).permit(:title, :short_description, :long_description, :address, :date, :user_id, :latitude, :longitude)
    end

end
