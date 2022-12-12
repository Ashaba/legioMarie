class MembersController < ApplicationController
  def index
    @members = Member.all
    
    respond_to do |format|
      format.json { render json: @members }
      format.html
    end
  end

  def show
    @member = Member.find(params[:id])
    respond_to do |format|
      format.json { render json: @member }
      format.html
    end
  end

  def birthday
    next_week = Date.today + 7.day
    today = Date.today
    
    @birthdays_today = Member.where(
      'EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) = ?',
      Date.today.strftime("%m"), Date.today.strftime("%d")
    )
    
    logger.tagged("MEMBERS") { logger.info "Next week comes at  #{next_week}" }
    @birthdays_coming_week = Member.where(
      'EXTRACT(month FROM birthday) <= ? AND EXTRACT(day FROM birthday) <= ? AND EXTRACT(day FROM birthday) >= ?
       AND EXTRACT(month FROM birthday) >= ?', next_week.strftime("%m"),
      next_week.strftime("%d"), today.strftime("%d"), today.strftime("%m")
    )

    respond_to do |format|
      format.json { render :json => {:today => @birthdays_today, :next_week => @birthdays_coming_week } }
      format.html
    end
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    logger.tagged("MEMBERS") { logger.info "New User  #{@member}" }
    if @member.save
      redirect_to @member
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to @member
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to members_path, status: :see_other
  end

  private

  def member_params
    params.require(:member).permit(
      :first_name,
      :last_name,
      :birthday,
      :mobile,
      :membership_type,
      :date_joined,
      :parish,
      :gender,
      :praesidium_id
    )
  end
end
