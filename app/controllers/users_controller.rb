class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show, :destroy]
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
         redirect_to user_path(@user)
        else
         render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @user.destroy
        if current_user.admin?
            redirect_to users_path
        else
            redirect_to root_path
        end
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
                redirect_to root_path
            end
        end
    
end