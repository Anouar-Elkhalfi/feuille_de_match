class DivisionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @divisions = Division.includes(:championship).order(created_at: :desc)
  end
  def new
    @division = Division.new
  end
  def create
    @division = Division.new(division_params)
    if @division.save
      redirect_to divisions_path, notice: "Division créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @division = Division.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to divisions_path, alert: "Cette division n'existe pas ou a été supprimée."
  end
  def update
    @division = Division.find(params[:id])
    if @division.update(division_params)
      redirect_to divisions_path, notice: "Division mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to divisions_path, alert: "Cette division n'existe pas ou a été supprimée."
  end
  def destroy
    @division = Division.find(params[:id])
    @division.destroy
    redirect_to divisions_path, notice: "Division supprimée avec succès."
  rescue ActiveRecord::RecordNotFound
    redirect_to divisions_path, alert: "Cette division n'existe pas ou a été supprimée."
  end

  private
  def division_params
    params.require(:division).permit(:name, :championship_id)
  end
  def check_admin
    redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_user.admin?
  end
end
