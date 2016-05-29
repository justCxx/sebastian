module Web
  class SessionsController < ApplicationController
    def new
      form Session::SignIn
    end

    def create
      run Session::SignIn do
        sign_in(user)
        flash[:success] = "Sucessfull login as #{current_user.email}"
        return redirect_to user_boards_path(user)
      end

      flash.now[:danger] = 'Invalid email or password'
      render :new
    end

    def destroy
    end

    protected

    def user
      @model
    end
  end
end
