class ForumsController < ApplicationController
    before_action :setup_whitelisted_params, only: [:create]
    def show
        @users = User.all
    end

    def new
        @forum_post = ForumPost.new
    end

    def create
        @forum_post = ForumPost.new(setup_whitelisted_params)
        # if @forum_post.errors.any?
            p "********************** #{@forum_post.errors.full_messages}"
        #     render "new"
        # end
        if @forum_post.save
            redirect_to action: :show
        else
            p "******************** Reloading post creation page"
            p "********************** #{@forum_post.errors.full_messages}"
            render :new
        end
    end

    private
    def setup_whitelisted_params
        whitelisted_params = params.require(:forum_post).permit(:user_id, :breed_id, :body)
    end
end