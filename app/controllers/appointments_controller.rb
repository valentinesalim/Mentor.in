class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:update, :destroy]
  before_action :find_event, only: [:new,:create]


 def index
    @appointments = Appointment.where(requester_id: current_user)
    @owner_appointments = current_user.appointments_as_owner
  end


  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    set_current_user
    @appointment.requester_id = @user.id
    @appointment.event_id = @event.id
    @appointment.date = Time.now
    if @appointment.save
      redirect_to appointments_path(current_user.id)
    else
      render :new
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_finished_params)
    redirect_to appointments_path
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private
  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:comment, :requester_id)
  end

  def appointment_finished_params
    params.permit(:status)
  end

  def set_current_user
    @user = current_user
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
