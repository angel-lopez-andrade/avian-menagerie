class CagesController < ApplicationController
    def index
        @cages = Cage.all
        @cage_varieties = CageVariety.all
    end

    def show
        @cage = Cage.find(params[:id])
        @price = "$#{Cage.find(params[:id]).price / 100.00}"
    end
end