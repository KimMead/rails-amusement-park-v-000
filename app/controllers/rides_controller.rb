class RidesController < ApplicationController
    
  def create    
      # current_user
      # @attraction = Attraction.find(params[:rides][:attraction_id])
      # ride = Ride.create(ride_params)
      # flash[:error] = ride.take_ride

      ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
      if ride
        response = ride.take_ride
        flash[:notice] = response
        redirect_to user_path(ride.user)
        flash[:message] = "Thanks for riding the #{attraction.name}!"
        
      else
        redirect_to user_path(@current_user)
      end 
    end

    private

    def ride_params
      params.require(:rides).permit(:user_id, :attraction_id)
    end
  end 