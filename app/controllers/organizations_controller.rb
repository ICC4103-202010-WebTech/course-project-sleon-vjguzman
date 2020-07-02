class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /organizations
  # GET /organizations.json
  def index
    @get_id = User.where(id: current_user.id).select(:id)
    @user_in = User.where(id: @get_id)
    @organization_show = Organization.where(id: params[:id]).select(:id)
    @events_show = Event.where(organization_id: @organization_show)
    @admin = MembersList.where(organization_id: @organization_show).where(user_role: 'admin').select(:user_id)
    @current_org =  Organization.where(id: MembersList.where(user_id: current_user.id).select(:organization_id).first.organization_id).select(:id).first.id
    @eventos_organizacion = Event.where(organization_id: @current_org)
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @get_id = User.where(id: current_user.id).select(:id)
    @user_in = User.where(id: @get_id)
    @organization_show = Organization.where(id: params[:id]).select(:id)
    @events_show = Event.where(organization_id: @organization_show).where(privacy_id: 1)
    @admin = MembersList.where(organization_id: @organization_show).where(user_role: 'admin').select(:user_id)
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.fetch(:organization, {}).permit(:id, :name, :description, :banner_org)
    end
end
