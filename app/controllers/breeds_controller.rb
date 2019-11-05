class BreedsController < ApplicationController
    before_action :setup_breeds

    def index
    end

    def new
        @breed = Breed.new
        @colors = BirdColor.all
    end

    def create
        @breed = Breed.new(setup_whitelisted_params)
        if @breed.save
            redirect_to breeds_path
        else
            redirect_to new_breed_path
        end
    end

    def setup_breeds
        @breeds = Breed.all
    end

    private
    def setup_whitelisted_params
        whitelisted_params = params.require(:breed).permit(:name, :pic, bird_color_ids: [])
    end
end