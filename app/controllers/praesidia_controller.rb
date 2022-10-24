class PraesidiaController < ApplicationController
  def index
    @praesidia = Praesidium.all
  end

  def show
    @praesidium = Praesidium.find(params[:id])
  end

  def new
    @praesidium = Praesidium.new
  end

  def create
    @praesidium = Praesidium.new(praesidium_params)

    if @praesidium.save
      redirect_to @praesidium
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @praesidium = Praesidium.find(params[:id])
  end

  def update
    @praesidium = Praesidium.find(params[:id])

    if @praesidium.update(praesidium_params)
      redirect_to @praesidium
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @praesidium = Praesidium.find(params[:id])
    @praesidium.destroy

    redirect_to praesidia_path, status: :see_other
  end

  private

  def praesidium_params
    params.require(:praesidium).permit(:name, :parish, :curia_id, :date_created)
  end
end
