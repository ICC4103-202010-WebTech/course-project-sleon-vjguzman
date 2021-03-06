class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end
  def new
    @message = @conversation.messages.new
  end

  def create
    @messages = @conversation.messages.new(message_params)
    if @messages.save
      redirect_to conversation_messages_path(@conversation)
    end
  end
  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end