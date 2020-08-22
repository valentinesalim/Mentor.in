class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
    set_user
    @events_user = Event.where(user: current_user)
    @appointments_user = Appointment.where(user: current_user)

  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :title, :expertise, :about, :content, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
