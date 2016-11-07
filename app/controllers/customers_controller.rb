class CustomersController < ApplicationController
  # before_action :authenticate_model!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all

  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @contacts = @customer.contacts.build
    @addresses = @customer.addresses.build
    @emails = @customer.emails.build
    @systems = @customer.systems.build
  end

  # GET /customers/1/edit
  def edit
    if @customer.contacts.count == 0
      @contacts = @customer.contacts.build
    elsif  @customer.addresses.count == 0
      @addresses = @customer.addresses.build
    elsif  @customer.emails.count == 0
      @emails = @customer.emails.build
    elsif  @customer.systems.count == 0
      @systems = @customer.systems.build
    else
    end
  end

  # POST /customers
  # POST /customers.json
  def create
      # render :json=> customer_params
      # return  
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
     # render :json=> customer_params
     #  return  
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
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
    @customer.destroy
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      # params.require(:customer).permit(:first_name, :last_name)
      params.fetch(:customer,{}).permit(:id, :first_name, :last_name, contacts_attributes: [:id, :number, :_destroy], emails_attributes: [:id, :eid, :_destroy], addresses_attributes: [:id, :name, :_destroy], systems_attributes: [:id, :category, :name, :number, :_destroy] )

    end
end
