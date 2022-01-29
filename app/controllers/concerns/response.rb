module Response
    def json_response(responseData,givenStatus)
      render json:responseData, except: [:id, :inbox_id, :conversation_id, :created_at, :updated_at], status: givenStatus
    end
  end
  