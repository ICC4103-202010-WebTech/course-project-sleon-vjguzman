class SystemAdminsController < ApplicationController
  before_action :set_system_admin, only: [:show, :edit, :update, :destroy]

  # GET /system_admins
  # GET /system_admins.json
  def index
    @system_admins = SystemAdmin.all
    @system_admin = SystemAdmin.select(:user_id).where(admin: TRUE)
    @admins = User.where(id: @system_admin)

  end

  # GET /system_admins/1
  # GET /system_admins/1.json
  def show
    @system_admin = SystemAdmin.select(:user_id).where(admin: TRUE)
    @admins = User.where(id: @system_admin)

  end

  # GET /system_admins/new
  def new
    @system_admin = SystemAdmin.new
  end

  # GET /system_admins/1/edit
  def edit
  end

  # POST /system_admins
  # POST /system_admins.json
  def create
    @system_admin = SystemAdmin.new(system_admin_params)

    respond_to do |format|
      if @system_admin.save
        format.html { redirect_to @system_admin, notice: 'System admin was successfully created.' }
        format.json { render :show, status: :created, location: @system_admin }
      else
        format.html { render :new }
        format.json { render json: @system_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system_admins/1
  # PATCH/PUT /system_admins/1.json
  def update
    respond_to do |format|
      if @system_admin.update(system_admin_params)
        format.html { redirect_to @system_admin, notice: 'System admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @system_admin }
      else
        format.html { render :edit }
        format.json { render json: @system_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_admins/1
  # DELETE /system_admins/1.json
  def destroy
    @system_admin.destroy
    respond_to do |format|
      format.html { redirect_to system_admins_url, notice: 'System admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_admin
      @system_admin = SystemAdmin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def system_admin_params
      params.fetch(:system_admin, {})
    end
end
