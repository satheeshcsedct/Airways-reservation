class SeatsController < ApplicationController
   before_filter :authenticate_user!, :except => [:index]  
  
  def index
    @seat=Seat.where(:flight_id=>'4')
  end

  def show
    @seat=Seat.find(params[:id])
  end

  def new
    @seat=Seat.new
    
  end


  def edit
     @seat=Seat.find(params[:id])
  end

  def create

    @seat=Seat.new(params[:seat])

    @seat.save
    test_id = params[:seat][:flight_id].to_i
    flash[:notice] = 'seat was successfully created.'
    redirect_to "/flights/#{test_id}"
  end

  def update
    @seat=Seat.find(params[:id])
    @seat.update_attributes(params[:seat])
    flash[:message] = "seat '#{@seat.id}'Updated!"
    redirect_to seat_path
  end

  def destroy
    #@flight=Flight.find(params[:id])
    @seat=Seat.find(params[:id])
    if @seat.delete
    redirect_to :action=>'index'
  else
    render 'index'
  end
  end
end