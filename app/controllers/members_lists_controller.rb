class MembersListsController < ApplicationController
  before_action :set_members_list, only: [:show, :edit, :update, :destroy]

  # GET /members_lists
  # GET /members_lists.json
  def index
    @get_id = Organization.where(id: params[:id]).select(:id)
    @eventos_org = Event.where(organization_id: @get_id).where(privacy_id: 1)
    @members_org = MembersList.where(organization_id: @get_id)
    @admin = MembersList.where(organization_id: @get_id).where(user_role: "admin")
  end

  # GET /members_lists/1
  # GET /members_lists/1.json
  def show
    @get_id = Organization.where(id: params[:id]).select(:id)
    @eventos_org = Event.where(organization_id: @get_id).where(privacy_id: 1)
    @members_org = MembersList.where(organization_id: @get_id)
    @admin = MembersList.where(organization_id: @get_id).where(user_role: "admin")
  end

  # GET /members_lists/new
  def new
    @organizacion = Organization.where(id: params[:id]).select(:id)
    @eventos_org = Event.where(organization_id: @organizacion).where(privacy_id: 1)
    @members_org = MembersList.where(organization_id: @organizacion)
    @admin = MembersList.where(organization_id: @organizacion).where(user_role: "admin")
  end

  # GET /members_lists/1/edit
  def edit
  end

  # POST /members_lists
  # POST /members_lists.json
  def create
    @members_list = MembersList.new(members_list_params)

    respond_to do |format|
      if @members_list.save
        format.html { redirect_to @members_list, notice: 'Members list was successfully created.' }
        format.json { render :show, status: :created, location: @members_list }
      else
        format.html { render :new }
        format.json { render json: @members_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members_lists/1
  # PATCH/PUT /members_lists/1.json
  def update
    respond_to do |format|
      if @members_list.update(members_list_params)
        format.html { redirect_to @members_list, notice: 'Members list was successfully updated.' }
        format.json { render :show, status: :ok, location: @members_list }
      else
        format.html { render :edit }
        format.json { render json: @members_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members_lists/1
  # DELETE /members_lists/1.json
  def destroy
    @members_list.destroy
    respond_to do |format|
      format.html { redirect_to members_lists_url, notice: 'Members list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_members_list
      @members_list = MembersList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def members_list_params
      params.fetch(:members_list, {})
    end
end
