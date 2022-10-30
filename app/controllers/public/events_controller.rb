class Public::EventsController < ApplicationController
  def index
    group = Group.find_by(id: current_customer.group_id)
    grouped_events = group ? group.events : [] # 自分が所属しているグル-プの全てのイベントを定義
    @events = current_customer.events #.where(id: grouped_events.ids) #グループのイベントとログインしているカスタマーが作成したイベントを繋ぐ
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.customer_id = current_customer.id
    if @event.save
      if @event.group_id
        redirect_to events_path
      else
        redirect_to events_path
      end
    else
      render :new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update(event_params) 
    if params[:event][:group_id] == "false"
     redirect_to events_path
    else
     redirect_to group_path(@event.group_id)
    end
  end
  
  private

  def event_params
    params.require(:event).permit(:title, :start_time, :finish_time, :customer_id, :group_id, :content)
  end
end