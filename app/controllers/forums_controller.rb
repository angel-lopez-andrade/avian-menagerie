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
            redirect_to action: :show
        else
            render :new
            # use render instead of redirect_to in order to keep the existing @forum_post instance
            # with its error messages from having passed through the model in its failed .save
            # , instead of recalling the new method and refreshing forum_post as ForumPost.new
        end
    end

    private
    def setup_whitelisted_params
        whitelisted_params = params.require(:forum_post).permit(:user_id, :breed_id, :body)
    end
end