class Public::EventsController < ApplicationController
  def index
   if current_customer.group.present? 
    grouped_events = Group.find(current_customer.group_id).events # 自分が所属しているグル-プの全てのイベントを定義
    @events = current_customer.events.concat(grouped_events)#グループのイベントとログインしているカスタマーが作成したイベントを繋ぐ
   else
    redirect_to groups_path 
   end
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.customer_id = current_customer.id
    @event.save!
    #byebug
    if params[:event][:group_id] == "false"
     redirect_to events_path
    else
     redirect_to group_path(@event.group_id)
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time, :customer_id, :group_id)
  end
end