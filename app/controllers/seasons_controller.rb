class SeasonsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @seasons = Season.all.order(created_at: :desc)
  end
  def new
    @season = Season.new
  end
  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to seasons_path, notice: "Saison créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @season = Season.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to seasons_path, alert: "Cette saison n'existe pas ou a été supprimée."
  end

  def update
    @season = Season.find(params[:id])
    if @season.update(season_params)
      redirect_to seasons_path, notice: "Saison mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private

  def check_admin
    redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_user.admin?
  end
  def season_params
    params.require(:season).permit(:name)
  end
end
