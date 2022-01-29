class InboxesController < ApplicationController

    def index
        @inboxes = Inbox.order("id DESC")
        json_response({status:"SUCCESS", message: "Inboxes retreived", data: @inboxes},:ok)
    end

    def show
        @inbox = Inbox.where(token:params[:token]).first
        if @inbox
            json_response({status:"SUCCESS", message: "Inbox retreived", data: @inbox},:ok)
        else
            json_response({status:"FAILURE", message: "Inbox not found", data: :null},:not_found)
        end
    end

    def create
        @inbox = Inbox.new(inbox_params)
        if @inbox.save
            json_response({status:"SUCCESS", message: "Inbox created", data: @inbox},:ok)
        else
            json_response({status:"FAILURE", message: "Inbox not created", data: :null},:bad_request)
        end
    end

    def update
        @inbox = Inbox.lock.where(token:params[:token]).first
        if @inbox.update_attributes(inbox_params)
            json_response({status:"SUCCESS", message: "Inbox updated", data: @inbox},:ok)
        else
            json_response({status:"FAILURE", message: "Inbox not updated", data: :null},:bad_request)
        end
    end 
    
    def destroy
        @inbox = Inbox.lock.where(token:params[:token]).first
        if @inbox.destroy
            json_response({status:"SUCCESS", message: "Inbox deleted", data: @inbox},:ok)
        else
            json_response({status:"FAILURE", message: "Inbox not updated", data: :null},:bad_request)
        end
    end 

    private
    def inbox_params
        params.permit(:name)
    end

end
