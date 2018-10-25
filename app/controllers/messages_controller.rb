class MessagesController < ApplicationController
  before_action :find_conversation

  def index
    if @conversation.receiver_id == current_user.id || @conversation.sender_id == current_user.id
      @messages = @conversation.messages

      @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)

      @message = @conversation.messages.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

private

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

    def find_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

end ### End of MessagesController
