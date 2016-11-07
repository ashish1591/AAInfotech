class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = Complaint.all
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
    @problem = @complaint.problems.build
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = Complaint.new(complaint_params)

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    # render :json=> params
    # return
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_all_systems
    cid =params[:id]
    list = []
    if !cid.nil?
      c = Customer.where({id: cid}).last
      if !c.nil?
        c.systems.each do |s|
          list.push({id: s.id, name: s.name})
        end
      end
    end
    render :json=> {list: list}
  end


  def create_update_problem_path
    render :json=> params
    return
  end

  def get_problem_partial
    cid = params[:cid]
    pid = params[:pid]
    complaint = Complaint.where({id: cid}).last
    if !pid.nil? and !complaint.nil?
      if pid != "none"
        problem = Problem.where({:id=> pid}).last
      else
        problem = complaint.problems.create
      end
      status= 200
    end
    respond_to do |format|
      if status == 200
        format.html { render :partial=>'/complaints/problem/new_edit', :locals=>{:problem=> problem, :complaint=> complaint} }
      else
        format.json { render json: {data: "error record not found"}, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.fetch(:complaint, {}).permit(:date, :amt_total, :customer_id, :system_id, :complaint_status, :suspended, :closing_date, :reason )
    end
end