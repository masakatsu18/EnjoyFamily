class Public::EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @events = Event.new(event_params)
    @events.save
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time)
  end
end