class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @post = current_user.posts.build
    end

    def index
        @posts = Post.all
    end

    def create
        @post = current_user.posts.build(post_params)
        @post.user_id = current_user.id
        respond_to do |format|
            if @post.save
                format.html { redirect_to root_path notice: "Post was successfully created," }
            end
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

end