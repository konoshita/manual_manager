class Admin::UsersController < Admin::BaseController
    before_action :set_user, only: %i[show edit update withdrawal]
    
    def index
        @users = User.all
    end
    
    def show; end

    def edit; end

    def update
        if @user.update(user_params)
            redirect_to admin_user_path(@user), success: t('defaults.message.updated', item: User.model_name.human)
        else
            flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
            render :edit
        end
    end

    def withdrawal
        @user.update(is_deleted: !@user.is_deleted)
    
           if @user.is_deleted
              flash[:notice] = "退会処理を実行いたしました"
           else
              flash[:notice] = "有効にします"
           end
              redirect_to admin_root_path
       
     end

    private

    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:email, :last_name, :first_name, :avatar, :avatar_cache, :role)
    end
end
