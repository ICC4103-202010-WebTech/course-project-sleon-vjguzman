class MailboxesController < ApplicationController
  before_action :set_mailbox, only: [:show, :edit, :update, :destroy]

  # GET /mailboxes
  # GET /mailboxes.json
  def index
    @get_id = User.where(id: 1).select(:id)
    @mailboxes = MailBox.where(user_id: @get_id)
    @sent_messagess = SentMessage.where(to_email: User.where(id: @get_id).select(:email).first.email)
  end

  # GET /mailboxes/1
  # GET /mailboxes/1.json
  def show
    @get_id = User.where(id: 1).select(:id)
    @mailboxes = MailBox.where(user_id: @get_id)
    @sent_messagess = SentMessage.where(to_email: User.where(id: @get_id).select(:email).first.email)
  end

  # GET /mailboxes/new
  def new
    @mailbox = MailBox.new
  end

  # GET /mailboxes/1/edit
  def edit
  end

  # POST /mailboxes
  # POST /mailboxes.json
  def create
    @mailbox = MailBox.new(mailbox_params)

    respond_to do |format|
      if @mailbox.save
        format.html { redirect_to @mailbox, notice: 'Mailbox was successfully created.' }
        format.json { render :show, status: :created, location: @mailbox }
      else
        format.html { render :new }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailboxes/1
  # PATCH/PUT /mailboxes/1.json
  def update
    respond_to do |format|
      if @mailbox.update(mailbox_params)
        format.html { redirect_to @mailbox, notice: 'Mailbox was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailbox }
      else
        format.html { render :edit }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailboxes/1
  # DELETE /mailboxes/1.json
  def destroy
    @mailbox.destroy
    respond_to do |format|
      format.html { redirect_to mailboxes_url, notice: 'Mailbox was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailbox
      @mailbox = MailBox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mailbox_params
      params.fetch(:mailbox, {})
    end
end
