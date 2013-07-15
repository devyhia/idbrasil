class ApiController < ApplicationController
  def save_budget
    @budget = JSON.parse(params[:budget])
    
    if(@budget["id"] != "" && @budget["id"] =~ /^\d+$/) # removing existing products 
      ActiveRecord::Base.connection.execute("delete from budget_products where budget_id = #{@budget["id"]}")
      @mybudget = Budget.find_by_id(@budget["id"])
    end
    
    if (!@mybudget)
        @mybudget = Budget.create(
      customer_id: @budget["customer"],
      total_budget: @budget["total_budget"],
      total_value: @budget["total_value"],
      total_discount: @budget["total_discount"],
      total_amount: @budget["total_amount"])
    else
      @mybudget.customer_id = @budget["customer"]
      @mybudget.total_budget = @budget["total_budget"]
      @mybudget.total_value = @budget["total_value"]
      @mybudget.total_discount = @budget["total_discount"]
      @mybudget.total_amount = @budget["total_amount"]
      
      @mybudget.save
    end
    
    for prod in @budget["products"]
      @prod = BudgetProducts.create(
      budget_id: @mybudget.id,
      product_id: prod["id"],
      price: prod["price"],
      quantity: prod["quantity"],
      value: prod["value"],
      discount: prod["discount"],
      total: prod["total"])
    end
    
    render :nothing => true
  end
  def get_customers
    if(params[:q])
      @customers = Customer.where("Name ~* ?", params[:q])
    else
      @customers = Customer.all
    end
    
    render :json => @customers
  end

  def get_customer
    @customer = Customer.find_by_name(params[:name])
    render :json => @customer
  end

  def get_products
    if (params[:q])
      @products = Product.where("name ~* ?", params[:q])
    else
      @products = Product.all      
    end
    render :json => @products
  end

  def get_product
    @product = Product.find_by_name(params[:name])
    render :json => @product
  end
end
