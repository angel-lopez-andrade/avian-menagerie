class SnacksController < ApplicationController
    def index
        @snacks = Snack.all
        @snack_varieties = SnackVariety.all
    end

    def show
        @snack = Snack.find(params[:id])
        @price = "$#{Snack.find(params[:id]).price / 100.0}"
    end
end