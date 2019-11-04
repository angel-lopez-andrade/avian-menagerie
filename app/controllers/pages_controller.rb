class PagesController < ApplicationController
    before_action :authenticate_user!
    before_action :setup_home_link, only: :home
    def home
    end

    def about
    end

    def setup_home_link
        if user_signed_in?
            @link = breeds_path
        else
            @link = new_user_session_path
        end
    end
end