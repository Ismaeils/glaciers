class SearchController < ApplicationController
    def search
        @conversation = Conversation.where(number: params[:conversation_number]).first
        if params[:term].nil?
            json_response({status:"SUCCESS", message: "No matching messages were found", data: []},:ok)
        else
            @messages = @conversation.messages.search(params[:term])
            json_response({status:"SUCCESS", message: "Matching messages found", data: @messages},:ok)
        end
    end
end