class ChoiceOfDatesController < ApplicationController
  before_action :set_choice_of_date, only: [:show, :edit, :update, :destroy]

  # GET /choice_of_dates
  # GET /choice_of_dates.json
  def index
    @choice_of_dates = ChoiceOfDate.all
  end

  # GET /choice_of_dates/1
  # GET /choice_of_dates/1.json
  def show
  end

  # GET /choice_of_dates/new
  def new
    @choice_of_date = ChoiceOfDate.new
  end

  # GET /choice_of_dates/1/edit
  def edit
  end

  # POST /choice_of_dates
  # POST /choice_of_dates.json
  def create
    @choice_of_date = ChoiceOfDate.new(choice_of_date_params)

    respond_to do |format|
      if @choice_of_date.save
        format.html { redirect_to @choice_of_date, notice: 'Choice of date was successfully created.' }
        format.json { render :show, status: :created, location: @choice_of_date }
      else
        format.html { render :new }
        format.json { render json: @choice_of_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /choice_of_dates/1
  # PATCH/PUT /choice_of_dates/1.json
  def update
    respond_to do |format|
      if @choice_of_date.update(choice_of_date_params)
        format.html { redirect_to @choice_of_date, notice: 'Choice of date was successfully updated.' }
        format.json { render :show, status: :ok, location: @choice_of_date }
      else
        format.html { render :edit }
        format.json { render json: @choice_of_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choice_of_dates/1
  # DELETE /choice_of_dates/1.json
  def destroy
    @choice_of_date.destroy
    respond_to do |format|
      format.html { redirect_to choice_of_dates_url, notice: 'Choice of date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choice_of_date
      @choice_of_date = ChoiceOfDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def choice_of_date_params
      params.fetch(:choice_of_date, {})
    end
end
