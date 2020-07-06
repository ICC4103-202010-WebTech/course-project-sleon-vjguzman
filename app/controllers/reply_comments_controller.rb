class ReplyCommentsController < ApplicationController
  before_action :set_reply_comment, only: [:show, :edit, :update, :destroy]

  # GET /reply_comments
  # GET /reply_comments.json
  def index
    @reply_comments = ReplyComment.all
  end

  # GET /reply_comments/1
  # GET /reply_comments/1.json
  def show
  end

  # GET /reply_comments/new
  def new
    @reply_comment = ReplyComment.new
  end

  # GET /reply_comments/1/edit
  def edit
  end

  # POST /reply_comments
  # POST /reply_comments.json
  def create
    @reply_comment = ReplyComment.new(reply_comment_params)
    respond_to do |format|
      if @reply_comment.save
        format.html {  redirect_back(fallback_location: root_path, notice: 'Reply comment was successfully created.') }
        format.json { render :show, status: :created, location: @reply_comment }
      else
        format.html { render :new }
        format.json { render json: @reply_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reply_comments/1
  # PATCH/PUT /reply_comments/1.json
  def update
    respond_to do |format|
      if @reply_comment.update(reply_comment_params)
        format.html { redirect_to root_path, notice: 'Reply comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply_comment }
      else
        format.html { render :edit }
        format.json { render json: @reply_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reply_comments/1
  # DELETE /reply_comments/1.json
  def destroy
    @reply_comment.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'Reply comment was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply_comment
      @reply_comment = ReplyComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_comment_params
      params.fetch(:reply_comment, {}).permit(:id, :event_id, :user_id, :comment_id, :message)
    end
end
