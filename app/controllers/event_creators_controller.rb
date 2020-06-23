class EventCreatorsController < ApplicationController
  before_action :set_event_creator, only: [:show, :edit, :update, :destroy]

  # GET /event_creators
  # GET /event_creators.json
  def index
    @user = User.where(id: params[:id]).select(:id)
    @user_events = EventCreator.where(user_id: @user)
    @eventos = Event.where(id: @user_events.select(:event_id))
    @get_id = Event.where(id: params[:id]).select(:id)
    @event_foto = Event.where(id: @get_id)
    @event_name = Event.where(id: @get_id).select(:description)
    @event_date = Event.where(id: @get_id).select(:final_date)
    @event_location = Event.where(id: @get_id).select(:location)
    @event_title = Event.where(id: @get_id).select(:title)
    @id = Event.where(id: @get_id).select(:id)
    @guest = GuestList.where(event_id: @get_id)
  end

  # GET /event_creators/1
  # GET /event_creators/1.json
  def show
    @user = User.where(id: params[:id]).select(:id)
    @user_events = EventCreator.where(user_id: @user)
    @eventos = Event.where(id: @user_events.select(:event_id))
    @get_id = Event.where(id: params[:id]).select(:id)
    @event_foto = Event.where(id: @get_id)
    @event_name = Event.where(id: @get_id).select(:description)
    @event_date = Event.where(id: @get_id).select(:final_date)
    @event_location = Event.where(id: @get_id).select(:location)
    @event_title = Event.where(id: @get_id).select(:title)
    @id = Event.where(id: @get_id).select(:id)
    @guest = GuestList.where(event_id: @get_id)
  end

  # GET /event_creators/new
  def new
    @event_creator = EventCreator.new
  end

  # GET /event_creators/1/edit
  def edit
  end

  # POST /event_creators
  # POST /event_creators.json
  def create
    @event_creator = EventCreator.new(event_creator_params)

    respond_to do |format|
      if @event_creator.save
        format.html { redirect_to @event_creator, notice: 'Event creator was successfully created.' }
        format.json { render :show, status: :created, location: @event_creator }
      else
        format.html { render :new }
        format.json { render json: @event_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_creators/1
  # PATCH/PUT /event_creators/1.json
  def update
    respond_to do |format|
      if @event_creator.update(event_creator_params)
        format.html { redirect_to @event_creator, notice: 'Event creator was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_creator }
      else
        format.html { render :edit }
        format.json { render json: @event_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_creators/1
  # DELETE /event_creators/1.json
  def destroy
    @event_creator.destroy
    respond_to do |format|
      format.html { redirect_to event_creators_url, notice: 'Event creator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_creator
      @event_creator = EventCreator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_creator_params
      params.fetch(:event_creator, {})
    end
end
