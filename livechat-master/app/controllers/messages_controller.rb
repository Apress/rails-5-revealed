class MessagesController < ApplicationController
  before_action :require_user

  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.create! body: params[:message][:body]
    ActionCable.server.broadcast "messages", render(
      partial: 'messages/message',
      object: @message
    )
  end
end
