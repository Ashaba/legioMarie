class CuriaeController < ApplicationController
  def index
    @curiae = Curia.all
  end

  def show
    @curia = Curia.find(params[:id])
  end

  def new
    @curia = Curia.new
  end

  def create
    @curia = Curia.new(curia_params)

    if @curia.save
      redirect_to @curia
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @curia = Curia.find(params[:id])
  end

  def update
    @curia = Curia.find(params[:id])

    if @curia.update(curia_params)
      redirect_to @curia
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @curia = Curia.find(params[:id])
    @curia.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def curia_params
    params.require(:curia).permit(:name, :location, :date_created)
  end
end
