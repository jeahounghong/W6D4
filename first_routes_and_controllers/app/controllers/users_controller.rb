class UsersController < ApplicationController
    def index

        if params[:username]
            @user = User.where("username LIKE '%#{params[:username].to_s}%' ")
            #debugger
            redirect_to user_url(@user[0])
            #render json: User.where("username LIKE '%#{params[:username].to_s}%' ")
        else
            render json: User.all
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
            #redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def show
        #debugger
        @user = User.find(params[:id])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: @user
            #redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end