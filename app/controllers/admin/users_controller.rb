class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_project

  def index
    @users = User.reverse_all
  end

  def show
  end

  def new
    @user = User.new
    @user.build_member_information unless @user.member_information
  end

  def create
    @user = User.new(user_params)
    @user.save

    respond_with(@user, location: admin_users_path)
  end

  def edit
    @user.build_member_information unless @user.member_information
  end

  def update
    @user.update(user_params)

    respond_with(@user, location: [:admin, @user])
  end

  def destroy
    @user.destroy

    respond_with(@user, location: admin_users_path)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def authorize_project
      authorize(:user, :manage?)
    end

    def user_params
      params.require(:user).permit(:email, :name, :role,
        member_information_attributes: [:title, :description, :github_profile,
          :own_blog, :twitter, :linkedin])
    end
end
