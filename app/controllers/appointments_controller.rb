class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token
 def index
    @appointments = Appointment.where(requester_id: current_user)
    @owner_appointments = current_user.appointments_as_owner
  end

  def user_appointment
    user = User.find(params[:user_id])
    @appointments = Appointment.where(requester_id: user)
    @owner_appointments = user.appointments_as_owner
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @event = Event.find(params[:event_id])
    # user = User.find(params[:user_id])
    # @user = current_user

    # @appointment.requester_id = user

    @appointment.event_id = @event.id
    if @appointment.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_finished_params)
  end

  def destroy
    @appointment.destroy
  end

  private
  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :requester_id)
  end

  def appointment_finished_params
    params.permit(:status)
  end
end
