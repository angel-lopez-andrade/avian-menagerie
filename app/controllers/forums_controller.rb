class ForumsController < ApplicationController
    def show
        @users = User.all
    end

    def new
    end
end