class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all
    @users_name = User.where(full_name: params[:search])
    @users_username = User.where("username like ?", "%#{keywords}%") if keywords.present?
    @organizations = Organization.where("title like ?", "%#{keywords}%") if keywords.present?
    @events_title = Event.where("title like ?", "%#{keywords}%") if keywords.present?
    @events_description = Event.where("description like ?", "%#{keywords}%") if keywords.present?
    @events_creator = Event.where(id: EventCreator.where("description like ?", "%#{keywords}%").select(:event_id)) if keywords.present?
    @events_organization = Event.where(organization_id: Organization.where("name like ?", "%#{keywords}%").select(:id)) if keywords.present?
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])
  end

  # GET /searches/new
  def new
    @search = Search.new
  end


  # POST /searches
  # POST /searches.json
  def create
    @search = Search.create!(params[:search_params])
    redirect_to @search
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.fetch(:search, {})
    end
end
