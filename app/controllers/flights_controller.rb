class FlightsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  load_and_authorize_resource
  def index
    @flight=Flight.all
  end

  def show
    @flight=Flight.find(params[:id])
    @seat=Seat.all
    
  end

  def new
    @flight=Flight.new
  end

  def edit
     @flight=Flight.find(params[:id])
     authorize! if cannot? :update, @flight
  end

  def create
    @flight=Flight.new(params[:flight])
    @flight.save
    flash[:notice] = 'Flight was successfully created.'
    redirect_to :action=>'index'
  end

  def update
    @flight=Flight.find(params[:id])
    @flight.update_attributes(params[:flight])
    flash[:message] = "Flight '#{@flight}'Updated!"
    redirect_to flight_path(@flight)
  end

  def destroy
    @flight=Flight.find(params[:id])
    if @flight.delete
      flash[:message]="Hai! your flight is deleted"
    redirect_to :action=>'index'
  else
    render 'index'
  end
  end
  def view
    @flight=Flight.find(params[:id])
    @seat=Seat.all
    
  end
end
