# frozen_string_literal: true

module Api
  module V1
    class RefuelingsController < ::Api::V1::BaseController
      def index
        render json: {
          refuelings: current_user.refuelings.order(created_at: :desc)
        }, status: :ok
      end
    end
  end
end
