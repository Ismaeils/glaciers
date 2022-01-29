class MessagesController < ApplicationController

    def index
        @conversation = Conversation.where(number: params[:conversation_number]).first
        @messages = @conversation.messages.order("created_at DESC")
        json_response({status:"SUCCESS", message: "Messages retreived", data: @messages},:ok)
    end

    def create
        @conversation = Conversation.where(number: params[:conversation_number]).first
        @message = @conversation.messages.new(:conversation=>@conversation, :content=>message_params[:content])
        if @message.save!
            json_response({status:"SUCCESS", message: "Message created", data: @message},:ok)
        else
            json_response({status:"FAILURE", message: "Message not created", data: :null},:bad_request)
        end
    end

    def show
        @conversation = Conversation.where(number: params[:conversation_number]).first
        @message = @conversation.messages.where(number:params[:number]).first

        if @message
            json_response({status:"SUCCESS", message: "Message retreived", data: @message},:ok)
        else
            json_response({status:"FAILURE", message: "Message not found", data: :null},:not_found)
        end
    end

    def update
        @conversation = Conversation.where(number: params[:conversation_number]).first
        @message = @conversation.messages.lock.where(number:params[:number]).first
        if @message.update_attributes(message_params)
            json_response({status:"SUCCESS", message: "Message updated", data: @message},:ok)
        else
            json_response({status:"FAILURE", message: "Message not updated", data: :null},:bad_request)
        end
    end

    def destroy
        @conversation = Conversation.where(number: params[:conversation_number]).first
        @message = @conversation.messages.where(number:params[:number]).destroy_all
        if @message
            json_response({status:"SUCCESS", message: "Message deleted", data: @message},:ok)
        else
            json_response({status:"FAILURE", message: "Message not deleted", data: :null},:bad_request)
        end
    end

    private
    def message_params
        params.permit(:content)
    end
end