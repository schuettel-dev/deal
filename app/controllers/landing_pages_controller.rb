class LandingPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  layout 'promo'

  def show; end
end
