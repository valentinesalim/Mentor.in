class UsersController < ApplicationController
  def show
    set_user
    @events_user = Event.where(user: current_user)
    @appointments_user = Appointment.where(user: current_user)
    # @order = Order.find(params[:order_id])
    # @weekly_ingredient_list = @orders_user.weekly_ingredient_list
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
    authorize @user
  end
end
