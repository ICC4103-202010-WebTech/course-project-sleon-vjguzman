class API::V1:: EventsController < APIController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
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
    @event.choice_of_date = ChoiceOfDate.find(params[:choice_of_date_id])
    @event.privacy = Privacy.find(params[:privacy_id])
    @event.organization = Organization.find(params[:organization_id])
    if @event.save
      render :show, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      render :show, status: :ok, location: api_v1_events_path(@event)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end


  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.fetch(:event, {}).permit(:id, :description, :location, :final_date, :creation_date, :choice_of_date_id, :privacy_id, :organization_id)
  end
end
