class ChampionshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @championships = Championship.includes(:season).order(created_at: :desc)
  end
  def new
    @championship = Championship.new
  end
  def create
    @championship = Championship.new(championship_params)
    if @championship.save
      redirect_to championships_path, notice: "Championnat créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @championship = Championship.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to championships_path, alert: "Ce championnat n'existe pas ou a été supprimé."
  end
  def update
    @championship = Championship.find(params[:id])
    if @championship.update(championship_params)
      redirect_to championships_path, notice: "Championnat mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordNotFound
    redirect_to championships_path, alert: "Ce championnat n'existe pas ou a été supprimé."
  end
  def destroy
    @championship = Championship.find(params[:id])
    @championship.destroy
    redirect_to championships_path, notice: "Championnat supprimé avec succès."
  rescue ActiveRecord::RecordNotFound
    redirect_to championships_path, alert: "Ce championnat n'existe pas ou a été supprimé."
  end
  private

  def championship_params
    params.require(:championship).permit(:name, :season_id)
  end
  def check_admin
    redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_user.admin?
  end
end
