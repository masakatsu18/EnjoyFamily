class GroupsController < ApplicationController
  before_action :authenticate_customer!
  
      def new
        @group = Group.new
      end
      
      def index
        @groups = Group.all
        #@group = current_customer
        @groups = Group.page(params[:page])
      end
    

      def show
        @group = Group.find(params[:id])
        @events = @group.events
        @event = Event.new
      end
      
      def edit
        @group = Group.find(params[:id])
      end
     
      def create
        @group = Group.new(group_params)
        @group.owner_id = current_customer.id
        if @group.valid?
          @group.save
          redirect_to group_path(@group.id)
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
        params.require(:group).permit(:name, :introduction)
      end
      
end
