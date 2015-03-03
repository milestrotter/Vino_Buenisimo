class CellarsController < ApplicationController
  def index
  	@user = current_user
  	@cellars = User.find(current_user.id).cellars.all
  	# puts "\n\n\n\n\n\n\nI am in the cellars controller", "\n\n\n#{@cellars.classification}\n\n\n\n\n\n\n\n"
  end

  def show
  	# puts "\n\n\n\n\n\n\nI am in the cellars controller", "\n\n\n#{params[:id]}\n\n\n\n\n\n\n\n"
  	@user = current_user
  	@cellar = Cellar.find(params[:id])
  	@info = params[:wine]
  	@wines = @cellar.wines.joins(:wine_type, :wine_category).all
  	# puts "\n\n\n\n\n\n\nI am in the cellars controller", "\n\n\n#{@wines}\n\n\n\n\n\n\n\n"
  end

  def new
    @user = current_user
    @cellar = Cellar.new
  end

  def create
    # puts "\n\n\n\n\nI am in the create controller: #{cellar_params}\n\n\n\n\n"
    @cellar = Cellar.create(cellar_params)
    if @cellar
      redirect_to cellars_path
    else
      flash.now[:error] = "CellarWine addition failed"
      render action: "/cellars/new"
    end
  end

  def edit
  	@user = current_user
    @cellar = Cellar.find(params[:id])
    @wine_type = WineType.all
    @wine_category = WineCategory.all
    @wines = @cellar.wines.joins(:wine_type, :wine_category).all
  end

  private
    def cellar_params
      params.require(:cellar).permit(:name, :classification, :size, :user_id)
    end
end
