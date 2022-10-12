class Public::EventsController < ApplicationController
  def index
    @events = Event.all
  end
  #newメソッド追記
  def new
    @event = Event.new
  end
end