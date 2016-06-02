class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin, only: [:show, :index]

  def index
    @users = User.all
    @search = @users.search(params[:q] || {})
    @users = @search.result.paginate(page: params[:page] || 1, per_page: 10).order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'User does not exist'
    redirect_to users_admin_index_path
  end

end
