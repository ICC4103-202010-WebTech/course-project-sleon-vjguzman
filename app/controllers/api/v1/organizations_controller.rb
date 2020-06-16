class API::V1:: OrganizationsController < APIController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @organizations = Organization.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @organizations = Organization.all
  end

  # GET /events/new
  def new
    @organization = Organization.new
  end

  # GET /events/1/edita
  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      render :show, status: :created, location: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organization/1
  # PATCH/PUT /organization/1.json
  def update
    if @organization.update(organization_params)
      render :show, status: :ok, location: api_v1_organizations_path(@organization)
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end



  def destroy
    @organization.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organization_params
    params.fetch(:organization, {}).permit(:id, :name, :description)
  end
end

