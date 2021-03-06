class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @get_id = User.where(id: params[:id]).select(:id)
    @user_in = User.where(id: @get_id)
    @guest = GuestList.where(user_id: @get_id).select(:event_id)
    @invitations = Event.where(id: @guest)
    @user_member = MembersList.where(user_id: @get_id).select(:organization_id)
    @user_org = Organization.where(id: @user_member)
    @todos_usuarios = User.all
    @creador = EventCreator.where(user_id: @get_id).select(:event_id)
    @created = Event.where(id: @creador)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @get_id = User.where(id: params[:id]).select(:id)
    @user_in = User.where(id: @get_id)
    @guest = GuestList.where(user_id: @get_id).select(:event_id)
    @invitations = Event.where(id: @guest)
    @user_member = MembersList.where(user_id: @get_id).select(:organization_id)
    @user_org = Organization.where(id: @user_member)
    @todos_usuarios = User.all
    @creador = EventCreator.where(user_id: @get_id).select(:event_id)
    @created = Event.where(id: @creador)
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
        SystemAdmin.create(user_id: @user.id)
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
    Comment.where(user_id: @user.id).destroy_all
    EventCreator.where(user_id: @user.id).destroy_all
    GuestList.where(user_id: @user.id).destroy_all
    MembersList.where(user_id: @user.id).destroy_all
    Message.where(user_id: @user.id).destroy_all
    ReplyComment.where(user_id: @user.id).destroy_all
    Report.where(user_id: @user.id).destroy_all
    SystemAdmin.where(user_id: @user.id).destroy_all
    UserAdministration.where(user_id: @user.id).destroy_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
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
