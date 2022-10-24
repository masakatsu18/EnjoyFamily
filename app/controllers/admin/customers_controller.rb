class Admin::CustomersController < ApplicationController
 def index
  @customers = Customer.all
 end
 
 def edit
  @customer = Customer.find(params[:id])
 end
 
 def update
  @customer = Customer.find(params[:id])
  @customer.update(customer_params) 
  redirect_to admin_customers_path
 end
 
 def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
  redirect_to admin_customers_path
 end
 
 private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :name_kana, :email,:is_deleted, :family_structure,:title,:content,:start_time)
  end
end
