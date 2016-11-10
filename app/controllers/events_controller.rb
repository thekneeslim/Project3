class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # before_action :current_student, except: [:search]
  before_action :is_admin

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @event = Event.new

  end

  def search
    @event = Event.find(params[:id])
    if @event.start
      @event.start = @event.start.strftime("%I:%M%p")
    end
    if @event.end
      @event.end = @event.end.strftime("%I:%M%p")
    end
    puts "#{@event.start}"
    puts "==================="
    respond_to do |format|
      format.json { render :json => @event }
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
      if @event.update(event_params)
        if @current_student.admin
          redirect_to events_url
        else
          format.html { redirect_to @event, notice: 'Event was successfully updated.' }
          format.json { render :show, status: :ok, location: @event }
        end
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :start, :end, :description, :location, :name)
    end

end
