class RidesController < ApplicationController
    
  def create    
      current_user
      @attraction = Attraction.find(params[:rides][:attraction_id])
      ride = Ride.create(ride_params)
      flash[:error] = ride.take_ride
      
      flash[:message] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(@current_user)
    end
  end 