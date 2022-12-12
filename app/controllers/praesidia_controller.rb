class PraesidiaController < ApplicationController
  def index
    @praesidia = Praesidium.all
    respond_to do |format|
      format.json { render json: @praesidia }
      format.html
    end
  end

  def show
    @praesidium = Praesidium.find(params[:id])
    respond_to do |format|
      format.json { render json: @praesidium }
      format.html
    end
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
