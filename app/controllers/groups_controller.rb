class GroupsController < ApplicationController
  before_action :authenticate_customer!
  
      def new
        @group = Group.new
      end
      
      def index
      end

      def show
        @groups = Group.all
        @group = Group.find(params[:id])
        @events = @group.events
      end
      
      def edit
        @group = Group.find(params[:id])
      end
     
      def create
        @events = @group.events.new(event_params)
        @group = Group.new(group_params)
        if @group.save
          redirect_to group_path(@group)
        else
          render 'new'
        end
      end
    
      def update
       @group = Group.find(params[:id])
       @group.customers << current_customer
        if @group.update(group_params)
          redirect_to group_path(@group.id)
        else
          render "edit"
        end
      end
      
      def join
        @group = Group.find(params[:group_id])
        @group.customers << current_customer
        redirect_to group_path(@group.id)
      end
        
        def disjoin
         @group = Group.find(params[:group_id])
         @group.customers.delete(current_customer)
         redirect_to groups_path
        end
    
      private
    
      def group_params
        params.require(:group).permit(:name, :introduction, :group_id)
      end
      
end
