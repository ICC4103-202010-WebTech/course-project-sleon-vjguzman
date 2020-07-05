class AdminManagesController < ApplicationController
  before_action :set_admin_manage, only: [:show, :edit, :update, :destroy]

  # GET /admin_manages
  # GET /admin_manages.json
  def index
    @todos_usuarios = User.all
    @todos_eventos = Event.all
    @todos_organizaciones = Organization.all
  end

  # GET /admin_manages/1
  # GET /admin_manages/1.json
  def show
  end

  # GET /admin_manages/new
  def new
    @admin_manage = AdminManage.new
  end

  # GET /admin_manages/1/edit
  def edit
  end

  # POST /admin_manages
  # POST /admin_manages.json
  def create
    @admin_manage = AdminManage.new(admin_manage_params)

    respond_to do |format|
      if @admin_manage.save
        format.html { redirect_to @admin_manage, notice: 'Admin manage was successfully created.' }
        format.json { render :show, status: :created, location: @admin_manage }
      else
        format.html { render :new }
        format.json { render json: @admin_manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_manages/1
  # PATCH/PUT /admin_manages/1.json
  def update
    respond_to do |format|
      if @admin_manage.update(admin_manage_params)
        format.html { redirect_to @admin_manage, notice: 'Admin manage was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_manage }
      else
        format.html { render :edit }
        format.json { render json: @admin_manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_manages/1
  # DELETE /admin_manages/1.json
  def destroy
    @admin_manage.destroy
    respond_to do |format|
      format.html { redirect_to admin_manages_url, notice: 'Admin manage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_manage
      @admin_manage = AdminManage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_manage_params
      params.fetch(:admin_manage, {})
    end
end
