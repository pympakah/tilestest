class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.order("id")
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    puts "Hello Wordss"
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @customers = Customer.where(id:set_customer)

  end

  # POST /customers
  # POST /customers.json
  def create
        i = Customer.new
        i.name = params[:name]
        i.credit = params[:credit]
        i.save
        redirect_to '/customers'
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        i = Customer.find(params[:id])
        i.name = params[:name]
        i.credit = params[:credit]
        i.save

        format.html { redirect_to '/customers', notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    i = Customer.find(params[:id])
    i.destroy
    # @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.fetch(:customer, {})
    end

    
end
