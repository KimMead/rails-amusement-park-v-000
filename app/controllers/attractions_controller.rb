class AttractionsController < ApplicationController 
    before_action :admin_only, except: [:index, :show]
    
    def index
         
        @attractions = Attraction.all
    end
    
    def show
         
        @attraction = Attraction.find(params[:id])
    end
    
    def new
        @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.create(attractions_params)
        redirect_to attraction_path(@attraction)
    end
    
    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update 
        @attraction = Attraction.find(params[:id])
        @attraction.update(attractions_params)
        redirect_to attraction_path(@attraction) 
    end 

    def destroy
        @attraction = Attraction.find(params[:id])
        @attraction.destroy
        redirect_to attractions_path
      end
    
    private
    
    
    def attractions_params
        params.require(:attraction).permit(:name, :min_height,
                                          :happiness_rating, :nausea_rating, :tickets)
    end
end
