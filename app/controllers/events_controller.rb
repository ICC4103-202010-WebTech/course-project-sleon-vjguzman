class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /events
  # GET /events.json
  def index
    @user = User.where(id: current_user.id)
    @user_events = EventCreator.where(user_id: @user)
    @eventos = Event.where(id: @user_events.select(:event_id))
    @get_id = Event.where(id: params[:id]).select(:id)
    @guest = GuestList.where(event_id: @get_id)
    @comments = Comment.where(event_id: @get_id)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @user = User.where(id: current_user.id)
    @user_events = EventCreator.where(user_id: @user)
    @eventos = Event.where(id: @user_events.select(:event_id))
    @get_id = Event.where(id: params[:id]).select(:id)
    @guest = GuestList.where(event_id: @get_id)
    @comments = Comment.where(event_id: @get_id)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    puts event_params
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        @guest_list = GuestList.create(user_id: current_user.id, event_id: @event.id)
        @event_date = EventDate.create(date: "2020-01-01 01:01:01", event_id: @event.id)
        multimedia = Multimedium.create(event_id: @event.id)
        @event_creator = EventCreator.create(user_id: current_user.id, event_id: @event.id)
        @id_org = MembersList.where(user_id: current_user.id).select(:organization_id)
        @event.organization_id = @id_org
        format.html { redirect_to event_creators_path(current_user.id), notice: "Your event was successfully created"}
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_creators_path(current_user.id), notice: "Your event was successfully updated"}
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: "Your Event was successfully destroyed")}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:id,:title, :description, :location, :final_date, :creation_date, :choice_of_date_id, :privacy_id, :organization_id, :banner_picture, images: [], files: [], videos: [])
    end
end
