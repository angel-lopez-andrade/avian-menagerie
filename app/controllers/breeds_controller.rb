class BreedsController < ApplicationController
    before_action :setup_breeds

    def index
    end

    def new
    end

    def create
    end

    def setup_breeds
        @breeds = Breed.all
    end
end