class MultimediaController < ApplicationController
  before_action :set_multimedium, only: [:show, :edit, :update, :destroy]

  # GET /multimedia
  # GET /multimedia.json
  def index
    @get_id = Event.where(id: params[:id]).select(:id)
    @multimedia_event = Multimedium.where(event_id: @get_id)
    @event_multimedia = Event.where(id: @get_id).select(:files)
    @event_images = Event.where(id: @get_id).select(:images)
    @event_videos = Event.where(id: @get_id).select(:videos)
  end

  # GET /multimedia/1
  # GET /multimedia/1.json
  def show
    @get_id = Event.where(id: params[:id]).select(:id)
    @multimedia_event = Multimedium.where(event_id: @get_id)
    @event_multimedia = Event.where(id: @get_id).select(:files)
    @event_images = Event.where(id: @get_id).select(:images)
    @event_videos = Event.where(id: @get_id).select(:videos)
  end

  # GET /multimedia/new
  def new
    @multimedium = Multimedium.new
  end

  # GET /multimedia/1/edit
  def edit
  end

  # POST /multimedia
  # POST /multimedia.json
  def create
    @multimedium = Multimedium.new(multimedium_params)

    respond_to do |format|
      if @multimedium.save
        format.html { redirect_to @multimedium, notice: 'Multimedium was successfully created.' }
        format.json { render :show, status: :created, location: @multimedium }
      else
        format.html { render :new }
        format.json { render json: @multimedium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimedia/1
  # PATCH/PUT /multimedia/1.json
  def update
    respond_to do |format|
      if @multimedium.update(multimedium_params)
        format.html { redirect_to @multimedium, notice: 'Multimedium was successfully updated.' }
        format.json { render :show, status: :ok, location: @multimedium }
      else
        format.html { render :edit }
        format.json { render json: @multimedium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedia/1
  # DELETE /multimedia/1.json
  def destroy
    @multimedium.destroy
    respond_to do |format|
      format.html { redirect_to multimedia_url, notice: 'Multimedium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedium
      @multimedium = Multimedium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multimedium_params
      params.fetch(:multimedium, {})
    end
end
