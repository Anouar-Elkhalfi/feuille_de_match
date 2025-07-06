class CalendarsController < ApplicationController
  def index
    @seasons = Season.order(name: :desc)
    @championships = Championship.all
    @divisions = Division.all
    @matches = Match.includes(:home_club, :away_club, division: { championship: :season })

    if params[:division_id].present?
      @matches = @matches.where(division_id: params[:division_id])
    else
      if params[:championship_id].present?
        @matches = @matches.joins(division: :championship).where(championships: { id: params[:championship_id] })
      end
      if params[:season_id].present?
        @matches = @matches.joins(division: { championship: :season }).where(seasons: { id: params[:season_id] })
      end
    end

    if params[:match_day].present?
      @matches = @matches.where(match_day: params[:match_day])
    end

    @matches = @matches.order(date: :asc, kickoff_time: :asc)
  end
end
