class BirdsController < ApplicationController
    before_action :setup_birds, :setup_breed_name, only: :index
    before_action :setup_bird, :setup_dollar_price, only: :show
    # before_action :setup_whitelisted_params, only: :new

    def index
    end

    def new
        @bird = Bird.new #.create(whitelisted_params)
        @breeds = Breed.all
        @bird_colors = BirdColor.all
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

    private
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

    def setup_dollar_price
        @dollar_price = "$ #{@bird.price / 100.0}"
    end

    # def setup_whitelisted_params
    #     whitelisted_params = params.require(:bird).permit(:name, :breed_id, :age, :color, :price, :description, :pic)
    # end
end