class SnacksController < ApplicationController
    def index
        @snacks = Snack.all
        @snack_varieties = SnackVariety.all
    end

    def show
    end
end