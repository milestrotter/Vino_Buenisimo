class WinesController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@user = current_user
  	@cellar = Cellar.find(params[:id])
  	@wine_type = WineType.all
  	@wine_category = WineCategory.all
  	@wine = Wine.new
  end

  def create
  	@wine = Cellar.find(params[:wine][:cellar_id]).wines.create(wine_params)
  	if @wine
  		params[:id] = params[:wine][:cellar_id]
  		redirect_to cellar_path(:id => params[:wine][:cellar_id] ), notice: "Wine was successfully added to cellar."
  	else
  		flash.now[:error] = "Wine addition failed"
  		render action: "/wines/new"
  	end
  end

  def edit
    @user = current_user
    @cellar = Cellar.find(params[:id])
    @wine_type = WineType.all
    @wine_category = WineCategory.all
    @wine = Wine.new
  end

  def update
    puts "\n\n#{params[:wine]}\n\n\n\n"
    @wine = Cellar.find(params[:wine][:cellar_id]).wines.where(wine_params).all
     puts "\n\n#{@wine}\n\n\n\n"
    if @wine
      puts "\n\n\n\nthe wine is true!!\n\n\n"
    else
      puts "\n\n\n\nthe wine is false!!\n\n\n"
    end
    puts "\n\n\n"
    # puts @wine_entry
    puts "\n\n\n"
    redirect_to :back
  end

  def destroy
    # puts "\n\n\n\n\nI am in the destroy controller: #{params}\n\n\n\n\n"
    wine = WineCellar.where(cellar_id: params[:cellar_id], wine_id: params[:id]);
    # puts "\n\n\n\n#{params[:cellar_id]} #{params[:id]}\n\n\n"
    # puts wine
    wine.destroy_all
    redirect_to :back
  end

  private
  	def wine_params
      
  		params.require(:wine).permit(:winery, :wine_type_id, :year, :price, :wine_category_id)
  	end
end
