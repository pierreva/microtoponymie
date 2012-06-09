class ToponymesController < ApplicationController
  #before_filter :authenticate_user!
  before_filter :find_enqueteur
  before_filter :find_toponyme, :only => [:show, :edit, :update, :destroy]
  #before_filter :authorize_create!, :only => [:new, :create]
  #before_filter :authorize_update!, :only => [:edit, :update]
  #before_filter :authorize_delete!, :only => :destroy
  def new
    @toponyme = @enqueteur.toponymes.build
    #5.times { @toponyme.assets.build }


  end
  def create
    @toponyme = @enqueteur.toponymes.build(params[:toponyme])
    if @toponyme.save
      flash[:notice] = "Toponyme has been created."
      redirect_to [@enqueteur, @toponyme]
    else
      flash[:alert] = "Toponyme has not been created."
      render :action => "new"
    end
  end
  def show
  end
  def edit
    @toponyme = Toponyme.find(params[:id])
    #5.times { @toponyme.assets.build }
  end
  def update
    if @toponyme.update_attributes(params[:toponyme])
      flash[:notice] = "Toponyme has been updated."
      redirect_to [@enqueteur, @toponyme]
    else
      flash[:alert] = "Toponyme has not been updated."
      render :action => "edit"
    end
  end
  private
  def find_enqueteur
    @enqueteur = Enqueteur.find(params[:enqueteur_id])
  end
  def find_toponyme
    @toponyme = @enqueteur.toponymes.find(params[:id])
  end
  #def authorize_create!
  #  if !current_user.admin? && cannot?("create toponymes".to_sym, @enqueteur)
  #    flash[:alert] = "You cannot create toponymes on this enqueteur."
   #   redirect_to @enqueteur
   # end
  #end
  #def authorize_update!
  #  if !current_user.admin? && cannot?(:"edit toponymes", @enqueteur)
  #    flash[:alert] = "You cannot edit toponymes on this enqueteur."
  #    redirect_to @enqueteur
  #  end
  #end
  #def authorize_delete!
  #  if !current_user.admin? && cannot?(:"delete toponymes", @enqueteur)
  #    flash[:alert] = "You cannot delete toponymes from this enqueteur."
  #    redirect_to @enqueteur
  #  end
  #end
end
