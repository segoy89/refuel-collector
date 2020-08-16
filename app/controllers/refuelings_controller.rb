class RefuelingsController < ApplicationController
  before_action :load_refueling, except: %i[new create]

  def new
    @refueling = current_user.refuelings.build
  end

  def create
    @refueling = current_user.refuelings.build(refueling_params)
    if @refueling.save
      flash[:success] = 'Refueling was created'
      redirect_to root_path
    else
      flash[:alert] = @refueling.errors.full_messages.join('<br/>')
      render :new
    end
  end

  def update
    if @refueling.update(refueling_params)
      flash[:success] = 'Refueling was updated'
      redirect_to root_path
    else
      flash[:alert] = @refueling.errors.full_messages.join('<br/>')
      render :edit
    end
  end

  def destroy
    if @refueling.destroy
      flash[:success] = 'Refueling was deleted'
      redirect_to root_path
    end
  end

  private

  def load_refueling
    @refueling = current_user.refuelings.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error e
    flash[:alert] = 'Resource not found!'
    redirect_to root_path
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
