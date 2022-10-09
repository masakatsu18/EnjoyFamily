class Admin::CustomersController < ApplicationController
 def index
    @customers = Customer.page(params[:page])
 end
 
 def update
    @customer.update(customer_params) ? (redirect_to admin_customer_path(@customer)) : (render :edit)
 end
end
