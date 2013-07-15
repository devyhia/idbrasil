class BudgetsController < ApplicationController
  # GET /budgets
  # GET /budgets.json
  include UsersHelper
  
  def index
    @budgets = Budget.select("budgets.*, customers.name as customer").joins("inner join customers on budgets.customer_id = customers.id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @budgets }
    end
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
    load_budget

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @budget }
    end
  end

  # GET /budgets/new
  # GET /budgets/new.json
  def new
    @budget = Budget.new
    @budgetProducts = []
    @customer = Customer.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @budget }
    end
  end

  # GET /budgets/1/edit
  def edit
    load_budget
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(params[:budget])

    respond_to do |format|
      if @budget.save
        format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        format.json { render json: @budget, status: :created, location: @budget }
      else
        format.html { render action: "new" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /budgets/1
  # PUT /budgets/1.json
  def update
    @budget = Budget.find(params[:id])

    respond_to do |format|
      if @budget.update_attributes(params[:budget])
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    if params[:id] =~ /\d+/
      @budget = Budget.find(params[:id])
      ActiveRecord::Base.connection.execute("delete from budget_products where budget_id = #{params[:id]}")
      @budget.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to budgets_url }
      format.json { head :no_content }
    end
  end
  
  private
  def load_budget
    @budget = Budget.find_by_id(params[:id])
    @budgetProducts = BudgetProducts.select("products.*, budget_products.*").joins("inner join Products on budget_products.product_id = products.id").find(:all, :conditions => {:budget_id => @budget[:id]})
    # "inner join Products on budget_products.product_id = products.id"
    @customer = Customer.find_by_id(@budget[:customer_id])
    # render :json => @customer
  end
end
