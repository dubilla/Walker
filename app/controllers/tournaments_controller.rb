class TournamentsController < ApplicationController
  def index
    render json: tournaments
  end

  def show
    render json: tournament
  end

  private

  def tournaments
    @tournaments ||= Tournament.all
  end

  def tournament
    @tournament ||= Tournament.includes(:competitors).order('competitors.score nulls last').find(params[:id])
  end
end
