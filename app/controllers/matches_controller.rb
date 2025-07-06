class MatchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @matches = Match.includes(:home_club, :away_club, :referee, :division).order(date: :desc)
  end
  def show
    @match = Match.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to matches_path, alert: "Ce match n'existe pas ou a été supprimé."
  end

  def new
    @match = Match.new
  end
  def create
      @match = Match.new(match_params)
    if @match.save
      redirect_to @match, notice: "Match créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @match = Match.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to matches_path, alert: "Ce match n'existe pas ou a été supprimé."
  end
  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      redirect_to @match, notice: "Match mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to matches_path, notice: "Match supprimé avec succès."
  end

private

def match_params
  params.require(:match).permit(
  :date,
  :kickoff_time,
  :stadium,
  :home_score,
  :away_score,
  :home_club_id,
  :away_club_id,
  :referee_id,
  :division_id
)
end
end
