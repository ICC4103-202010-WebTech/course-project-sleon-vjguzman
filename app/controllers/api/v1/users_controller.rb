class API::V1:: UsersController < APIController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @users = User.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @users = User.all
  end

  # GET /events/new
  def new
    @user = User.new
  end

  # GET /events/1/edita
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organization/1
  # PATCH/PUT /organization/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: api_v1_users_path(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end



  def destroy
    @user.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).permit(:id, :username, :full_name, :short_bio, :location, :email, :password)
  end
end

