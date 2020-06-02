class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @user = User.first
    @user_events = EventCreator.where(user_id: @user)
    @eventos = Event.where(id: @user_events)
    @get_id = Event.where(id: params[:id]).select(:id)
    @event_name = Event.where(id: @get_id).select(:description)
    @event_date = Event.where(id: @get_id).select(:final_date)
    @event_location = Event.where(id: @get_id).select(:location)
    @id = Event.where(id: @get_id).select(:id)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @user = User.first
    @user_events = EventCreator.where(user_id: @user)
    @eventos = Event.where(id: @user_events)
    @get_id = Event.where(id: params[:id]).select(:id)
    @event_foto = Event.where(id: @get_id)
    @event_name = Event.where(id: @get_id).select(:description)
    @event_date = Event.where(id: @get_id).select(:final_date)
    @event_location = Event.where(id: @get_id).select(:location)
    @id = Event.where(id: @get_id).select(:id)
    @guest = GuestList.where(event_id: @get_id)
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
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
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
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
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
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
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
      params.fetch(:event, {}).permit(:id, :description, :location, :final_date, :creation_date, :choice_of_date_id, :privacy_id, :organization_id, :banner_picture, :images, :files, :videos)
    end
end
