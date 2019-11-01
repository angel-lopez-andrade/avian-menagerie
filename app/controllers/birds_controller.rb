class BirdsController < ApplicationController
    before_action :setup_birds, :setup_breed_name, only: :index
    before_action :setup_bird, only: :show

    def index
    end

    def new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def setup_birds
        if Breed.find(params[:breed_id]).birds
            @birds = Breed.find(params[:breed_id]).birds
        end
    end

    def setup_breed_name
        @breed_name = Breed.find(params[:breed_id]).name
    end

    def setup_bird
        @bird = Breed.find(params[:breed_id]).birds.find(params[:bird_id])
    end
end