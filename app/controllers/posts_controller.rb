class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @post = current_user.posts.build
    end

    def index
        @post = Post.all
    end

end