class HomeController < ApplicationController
  def index
    @refuelings = current_user.refuelings.order(created_at: :desc)
  end
end
