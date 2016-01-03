class TournamentsController < ApplicationController
  def index
    render json: tournaments
  end

  private

  def tournaments
    @tournaments ||= Tournament.all
  end
end
