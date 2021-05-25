# frozen_string_literal: true

module Api
  module V1
    class RefuelingsController < ::Api::V1::BaseController
      before_action :load_refueling, only: %i[update destroy]

      def index
        render json: {
          total_avg:  FuelConsumption::TotalAvg.new(user: current_user).count,
          refuelings: current_user.refuelings.order(created_at: :desc)
        }, status: :ok
      end

      def create
        refueling = current_user.refuelings.build(refueling_params)
        refueling.avg_fuel_consumption = AvgFuelConsumption.new(
          liters:     refueling_params[:liters],
          kilometers: refueling_params[:kilometers]
        ).count

        if refueling.save
          render json: {
            success: true,
            refueling: refueling
          }, status: :ok
        else
          render json: {
            success: false,
            message: refueling.errors.to_sentences
          }, status: :unprocessable_entity
        end
      end

      def update
        @refueling.avg_fuel_consumption = AvgFuelConsumption.new(
          liters:     refueling_params[:liters],
          kilometers: refueling_params[:kilometers]
        ).count

        if @refueling.update(refueling_params)
          render json: {
            success: true,
            refueling: @refueling
          }, status: :ok
        else
          render json: {
            success: false,
            message: @refueling.errors.to_sentences
          }, status: :unprocessable_entity
        end
      end

      def destroy
        if @refueling.destroy
          render json: {
            success: true
          }, status: :ok
        end
      end

      private

      def load_refueling
        @refueling = current_user.refuelings.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error e
        render json: {
          success: false,
          message: 'Record not found!'
        }, status: :not_found
      end

      def refueling_params
        params.require(:refueling).permit(
          :liters,
          :kilometers,
          :cost,
          :note
        )
      end
    end
  end
end
