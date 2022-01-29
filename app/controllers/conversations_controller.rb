class ConversationsController < ApplicationController

    def index
        @inbox = Inbox.where(token:params[:inbox_token]).first
        @conversations = Conversation.where(inbox:@inbox.id).order('id DESC')
        json_response({status:"SUCCESS", message: "Conversations retreived", data: @conversations},:ok)
    end

    def create
        @inbox = Inbox.where(token:params[:inbox_token]).first
        @conversation = @inbox.conversations.new(:inbox=>@inbox)
        if @conversation.save
            json_response({status:"SUCCESS", message: "Conversation created", data: @conversation},:ok)
        else
            json_response({status:"FAILURE", message: "Conversation not created", data: :null},:bad_request)
        end
    end

    def show
        @inbox = Inbox.where(token:params[:inbox_token]).first
        @conversation = @inbox.conversations.where(number:params[:number]).first
        if @inbox
            json_response({status:"SUCCESS", message: "Conversation retreived", data: @conversation},:ok)
        else
            json_response({status:"FAILURE", message: "Conversation not found", data: :null},:not_found)
        end
    end

    # def update
    #     @inbox = Inbox.where(token:params[:inbox_token]).first
    #     @conversation = @inbox.conversations.lock.where(number:params[:number]).first
    #     if @conversation.update_attributes()
    #         json_response({status:"SUCCESS", message: "Conversation updated", data: @conversation},:ok)
    #     else
    #         json_response({status:"FAILURE", message: "Conversation not updated", data: :null},:bad_request)
    #     end
    # end

    def destroy
        puts params[:inbox_token]
        puts params[:number]
        @inbox = Inbox.where(token:params[:inbox_token]).first
        @conversation = @inbox.conversations.where(number:params[:number]).destroy_all
        if @conversation
            json_response({status:"SUCCESS", message: "Conversation deleted", data: @conversation},:ok)
        else
            json_response({status:"FAILURE", message: "Conversation not deleted", data: :null},:bad_request)
        end
    end
    
end