class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
    end

    def index
        @posts = Post.all
    end

end
