class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @post = Post.new
    end

    def index
        @posts = Post.all
    end

    def create
        @post.user_id = current_user.id
        if @post.save
            format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        end
    end

end