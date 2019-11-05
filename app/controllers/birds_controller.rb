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
        # calling method directly rather than having it be setup before_action
        @bird.price *= 100
        # price conversions in create controller
        @bird.user_id = current_user.id
        if @bird.save
            redirect_to bird_path(@bird.breed_id, @bird.id)
        else
            redirect_to new_bird_path
        end
        # non-GET methods need manual redirection
    end

    def show
    end

    def edit
        @bird = Bird.find(params[:bird_id])
        @breeds = Breed.all
        @bird_colors = BirdColor.all
    end

    def update
        @bird = Bird.find(params[:bird][:id])
        if @bird.update(setup_whitelisted_params)
            @bird.price *= 100
            redirect_to breeds_path
        else
            @bird = Bird.find(params[:bird_id])
            @breeds = Breed.all
            @bird_colors = BirdColor.all
            render action: "edit"
        end
    end

    def destroy
        Bird.find(params[:id]).destroy
        redirect_to birds_path(params[:breed_id])
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
        @dollar_price = "$ #{@bird.price / 100.00}"
    end

    def setup_whitelisted_params
        whitelisted_params = params.require(:bird).permit(:id, :name, :breed_id, :user_id, :age, :color, :price, :description, :pic)
    end
end