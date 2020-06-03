class GuestListsController < ApplicationController
  before_action :set_guest_list, only: [:show, :edit, :update, :destroy]

  # GET /guest_lists
  # GET /guest_lists.json
  def index
    @get_id = Event.where(id: params[:id]).select(:id)
    @guest_lists = GuestList.where(event_id: @get_id)
    @evento = Event.find(@get_id)
  end

  # GET /guest_lists/1
  # GET /guest_lists/1.json
  def show
    @get_id = Event.where(id: params[:id]).select(:id)
    @guest_lists = GuestList.where(event_id: @get_id)
  end

  # GET /guest_lists/new
  def new
    @guest_list = GuestList.new
  end

  # GET /guest_lists/1/edit
  def edit
  end

  # POST /guest_lists
  # POST /guest_lists.json
  def create
    @guest_list = GuestList.new(guest_list_params)
    respond_to do |format|
      if @guest_list.save
        format.html { redirect_to @guest_list, notice: 'Guest list was successfully created.' }
        format.json { render :show, status: :created, location: @guest_list }
      else
        format.html { render :new }
        format.json { render json: @guest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_lists/1
  # PATCH/PUT /guest_lists/1.json
  def update
    respond_to do |format|
      if @guest_list.update(guest_list_params)
        format.html { redirect_to @guest_list, notice: 'Guest list was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest_list }
      else
        format.html { render :edit }
        format.json { render json: @guest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_lists/1
  # DELETE /guest_lists/1.json
  def destroy
    @guest_list.destroy
    respond_to do |format|
      format.html { redirect_to guest_lists_url, notice: 'Guest list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_list
      @guest_list = GuestList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_list_params
      params.fetch(:guest_list, {}).permit(:id , :user_id, :event_id)
    end
end
