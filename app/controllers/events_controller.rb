class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all.order(title: :asc)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: 'Your event has been created'
    else
      render :new
    end
  end

  def edit
  end



  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :date, :category, :difficulty, :link, :photo)
    end
end
