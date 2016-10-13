class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :current_student, except: [:search]
  # before_action :is_admin, except: [:search]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @event = Event.new

  end

  def search
    puts "BREAKKKKKKKKKK"
    # puts params.inspect
    puts "BREAKKKKKKKKKK"
    @event = Event.find(params[:id])
    # @students = Student.where(:id => Course.where(:id => params[:id]))
    # @students = Student.all(:include => :course, :conditions => ["interests.id = ?", 4])
    # @students = Student.joins([:course]).where(id: params[:id])
    # @students = Student.Course.where(id: params[:id])
    # puts "Student: #{@students}"
    # puts "Event: #{@event}"
    respond_to do |format|
      format.json { render :json => @event }
      format.json { render :json => @students }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
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
