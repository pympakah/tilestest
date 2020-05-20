class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    puts "index path"
    @invoices = Invoice.all.order("id")

    invoices = Invoice.all.order("id")
    arr = []
    invoices.each do |invo| 
      a = ""
      if a != invo.bill_id
        arr.push(invo.bill_id) 
        a = invo.bill_id
      end
    end
    # puts arr
    @bills = Bill.where.not(id: arr)
    
    @customers = Customer.all

    @t = Time.now


  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    puts "new path"
    @invoice = Bill.find(params[:id])
    @bills = Bill.where(id:params[:id])

    @customers = Customer.where(id:params[:customer_id])
    @t = Time.now

    # puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>> #{params[:amount]}"



    if params[:cus_id]
      
    i = Invoice.new
    i.amount = params[:amount]
    i.invoice_date = params[:date]
    i.invoice_user = params[:name]
    i.bill_id = params[:id]
    i.save
    redirect_to '/invoices'
    # i = Customer.new
    #     i.name = params[:amount]
    #     i.save
    # puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>> #{i.errors}"
  end
    # if params[:cus_id]
    #   # puts params[:bill_no]
    
      # redirect_to '/invoices'
    # end
  end

  # GET /invoices/1/edit
  def edit
    puts "edit path"

  end

  # POST /invoices
  # POST /invoices.json
  def create
    puts "create path"
    
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      puts "set_invoice"
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      puts "invoice_params"
      params.fetch(:invoice, {})
      # params.require(:invoice).permit( :name, :amount,:date, :id)
    end
end
