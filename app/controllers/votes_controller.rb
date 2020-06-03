class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @guests = GuestList.where(event_id: params[:id]) #Todos lo invitados al evento
    @dates = Date.where()
    @votes_guest = Vote.where(guest_list_id: @get_id)
    @id_evento = GuestList.where(id: @get_id).select(:event_id)
    @get_id_evento = Event.where(id: @id_evento).select(:id)
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @get_id = GuestList.where(id: params[:id]).select(:id)
    @votes_guest = Vote.where(guest_list_id: @get_id)
    @id_evento = GuestList.where(id: @get_id).select(:event_id)
    @get_id_evento = Event.where(id: @id_evento).select(:id)
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.fetch(:vote, {})
    end
end
