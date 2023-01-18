class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :client_not_found

    def show
        client = Client.find( params[:id] )
        render json: client.total_membership_cost, status: :ok
    end

    private

    def client_not_found
        render json: { errors: ["Client was not found."] }, status: :not_found
    end
end
