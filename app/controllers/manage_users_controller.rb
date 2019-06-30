class ManageUsersController < ApplicationController
  before_action :set_user_object, only: [:update, :destroy, :show]

  # 管理画面 -> ユーザー一覧
  def index
    @q = User.all.order(id: :asc).ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(50)
  end

  # 管理画面 -> ユーザー作成
  def new
    @user = User.new
  end

  # 管理画面 -> ユーザー作成(Post)
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to manage_users_url, notice: "ユーザー「#{@user.name}を登録しました。」"
    else
      render :new
    end
  end

  # 管理画面 -> ユーザー詳細 & 編集
  def show

  end

  # 管理画面 -> ユーザー編集 (Post)
  def update

    if params[:image]
      @user.image_name = "#{@user.id}.png"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if params[:header_image]
      @user.header_image_name = "#{@user.id}.png"
      image = params[:header_image]
      File.binwrite("public/user_images/header/#{@user.image_name}", image.read)
    end

    @user.update!(user_params)
    redirect_to manage_users_url, notice: "コンテスト「#{@user.name}」を更新しました。"
  end

  # 管理画面 -> ユーザー削除
  def destroy
    @user.destroy
    redirect_to manage_users_url
  end

  private

  def user_params
    params.require(:user).permit(
                                  :name,
                                  :user_id,
                                  :email,
                                  :authority,
                                  :password,
                                  :password_confirmation,
                                  :is_test_user,
                                  :profile,
                                  :location,
                                  :reported_value,
                                  :trusted_value,
                                  :image_name
                                )
  end

  def set_user_object
    @user = User.find_by(user_id: params[:id])
  end
end
