class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all
    end
        
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
            flash[:success] = "Welcome to Alpha Club #{@user.username}"
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @user.update(user_params)
        flash[:success] = "Your profile has been updated sucessfully"
         redirect_to user_path(@user)
        else
         render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:danger] = "User and all of user's bookings have been deleted"
        redirect_to root_path
    end
    
    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
    
        def set_user
            @user = User.find(params[:id])
        end
    
        def require_same_user
            if current_user != @user and !current_user.admin?
                flash[:danger] = 'You can only edit your own account'
                redirect_to root_path
            end
        end
    
end