class BirdsController < ApplicationController
    before_action :setup_birds, :setup_breed_name, only: :index
    before_action :setup_bird, :setup_dollar_price, only: :show

    def index
    end

    def new
        @bird = Bird.new
        @breeds = Breed.all
        @bird_colors = BirdColor.all
    end

    def create
        @bird = Bird.new(setup_whitelisted_params)
        #calling method directly rather than having it be setup before_action
        @bird.price *= 100
        #price conversions in create controller
        @bird.user_id = current_user.id
        if @bird.save
            redirect_to bird_path(@bird.breed_id, @bird.id)
        else
            redirect_to new_bird_path
        end
        #non get methods need manual redirect
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

    def setup_whitelisted_params
        whitelisted_params = params.require(:bird).permit(:name, :breed_id, :age, :color, :price, :description, :pic)
    end
end