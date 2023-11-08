class UsersController < ApplicationController
    before_action :require_admin, only: [:edit, :update]
    def index
      @users = User.all
    end

    def show
        @user = User.find(params[:id])
      end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          respond_to do |format|
            format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
          end
        else
          respond_to do |format|
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

    private

    def require_admin
        unless current_user && current_user.admin?
            flash[:alert] = "You must be an admin to do that."
            redirect_to root_path
        end
    end

    def user_params
        params.require(:user).permit(:email, :admin)
      end
  end