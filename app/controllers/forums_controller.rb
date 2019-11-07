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
        if @forum_post.save
            redirect_to forum_path(params[:breed_id])
        else
            @forum_post = ForumPost.new
            redirect_to new_post_path
        end
    end

    private
    def setup_whitelisted_params
        whitelisted_params = params.require(:forum_post).permit(:user_id, :breed_id, :body)
    end
end