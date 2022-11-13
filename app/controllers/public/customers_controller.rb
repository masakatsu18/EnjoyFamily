class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!, only: [:edit, :update]

 def new
  @customer = Customer.new
 end

 def show
  @customer = current_customer
  if current_customer == nil
   redirect_to about_path
  end
 end

 def edit
  @customer = Customer.find(params[:id])
   if @customer == current_customer
      render "edit"
   else
      redirect_to customer_path(current_customer.id)
   end
 end

 def create
  @customer = Customer.new(customer_params)
  @customer.save
 end

 def update
  @customer = Customer.find(params[:id])
  @customer.update(customer_params)
  redirect_to customer_path(@customer.id)
 end

 private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :email,:is_deleted, :title,:content,:start_time)
  end
end
