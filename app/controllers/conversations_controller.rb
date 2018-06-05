class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @checkin = CheckIn.where(user: current_user).last
    @checkin_timeframe = 12.hours.ago

    checkins_array = []
    @conversations = []
    @users = []

    if @checkin.nil?
      @checkin_valid = false
    else
      @checkin_valid = @checkin.created_at > @checkin_timeframe
      checkins_array = CheckIn.where("created_at > ?", @checkin_timeframe).where(location: @checkin.location)

      checkins_array.each do |c|
        unless current_user.id == c.user.id
          found_conversation = Conversation.where("( recipient_id = ? AND sender_id = ? ) OR ( recipient_id = ? AND sender_id = ? ) ", current_user.id, c.user.id, c.user.id, current_user.id).first
          unless found_conversation.nil?
            @conversations << found_conversation
          end
          @users << c.user unless @conversations.pluck(:sender_id, :recipient_id).flatten.uniq.include? c.user.id
        end
      end

      @users = @users.reject(&:blank?).uniq
      @conversations = @conversations.reject(&:blank?).uniq
    end
  end

  def create
   if Conversation.between(params[:sender_id],params[:recipient_id]).present?
     @conversation = Conversation.between(params[:sender_id],
       params[:recipient_id]).first
   else
     @conversation = Conversation.create!(conversation_params)
   end
   redirect_to conversation_messages_path(@conversation)
 end

 private

 def conversation_params
   params.permit(:sender_id, :recipient_id)
 end

end
