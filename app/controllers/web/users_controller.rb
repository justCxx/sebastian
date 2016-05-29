module Web
  class UsersController < ApplicationController
    def new
      form User::Create
    end

    def create
      run User::Create do
        return redirect_to user_boards_path @model
      end
      render :new
    end

    def show
    end
  end
end
