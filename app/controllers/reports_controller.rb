class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @get_id = Event.where(id: params[:id]).select(:id)
    @my_reports = Report.where(user_id: current_user.id)
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @get_id = Event.where(id: params[:id]).select(:id)
    @my_reports = Report.where(user_id: current_user.id)
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    respond_to do |format|
      if @report.save
        @id = Report.where(id: @report.id).select(:event_id)
        @event = Event.where(id: @id)
        format.html { redirect_to event_path(@event.first), notice: 'Report was successfully created.' }
        format.json { render rooth_path, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to root_path, notice: 'Report was successfully updated.' }
        format.json { render root_path, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'Report was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.fetch(:report, {}).permit(:id,:description, :status, :user_id, :event_id)
    end
end
