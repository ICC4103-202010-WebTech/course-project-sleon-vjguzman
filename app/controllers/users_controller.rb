class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @get_id = User.where(id: params[:id]).select(:id)
    @first_user = User.first
    @id_user_in = User.where(id: 1).select(:id)
    @guest = GuestList.where(user_id: @id_user_in).select(:event_id)
    @invitations = Event.where(id: @guest)
    @user_member = MembersList.where(user_id: @id_user_in).select(:organization_id)
    @user_org = Organization.where(id: @user_member)
    @pagy, @events = pagy(Event.where(user_id = current_user.id))
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @users = User.all
    @get_id = User.where(id: params[:id]).select(:id)
    @guest = GuestList.where(user_id: @get_id).select(:event_id)
    @invitations = Event.where(id: @guest)
    @user_member = MembersList.where(user_id: @get_id).select(:organization_id)
    @user_org = Organization.where(id: @user_member)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:id, :username, :full_name, :short_bio, :location, :email, :password, :profile_picture)
    end
end
