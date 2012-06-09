class EnqueteursController < ApplicationController
  before_filter :find_enqueteur, :only => [:show, :edit, :update, :destroy]
  def index
    @enqueteurs = Enqueteur.for(current_user).all
  end

  def new
    @enqueteur = Enqueteur.new
  end
  def create
    @enqueteur = Enqueteur.new(params[:enqueteur])
    if @enqueteur.save
      flash[:notice] = "Enqueteur has been created."
      redirect_to @enqueteur

    else
      flash[:alert] = "Enqueteur has not been created."
      render :action => "new"
    end
  end
  def show
  end
  def edit
  end
  def update
    if @enqueteur.update_attributes(params[:enqueteur])
      flash[:notice] = "Enqueteur has been updated."
      redirect_to @enqueteur
    else
      flash[:alert] = "Enqueteur has not been updated."
      render :action => "edit"
    end
  end
  def destroy
    @enqueteur.destroy
    flash[:notice] = "Enqueteur has been deleted."
    redirect_to enqueteurs_path
  end
  private
  def find_enqueteur
    @enqueteur = Enqueteur.for(current_user).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The enqueteur you were looking for could not be found."
    redirect_to root_path
  end
end
