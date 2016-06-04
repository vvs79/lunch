class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin, only: [:orders_for_today]

  # def index
  #   @date = DateTime.now
  #   @orders = current_user.admin? ? Order.all.order(id: :desc) : current_user.orders.all.order(id: :desc)
  # end

  def new
    @date = DateTime.now
    @items = Item.all
    @order = current_user.orders.new
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      @order.update(total: @order.sum_order)
      UsersMailer.order_created(@order).deliver_now
      flash[:success] = "Order was successfully created ID:#{@order.id} - total:#{@order.total}"
      redirect_to :back
    else
      render 'new'
    end
  end

  # def show
  #   @order = current_user.orders.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   flash[:danger] = 'Order does not exist!'
  #   redirect_to orders_path
  # end

  # def destroy
  #   @order = Order.find(params[:id])
  #   UsersMailer.order_destroyed(@order).deliver_now
  #   Order.find(params[:id]).destroy
  #   # flash[:success] = 'Order deleted'
  #   redirect_to orders_path
  # end

  def orders_for_today
    @orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  private

    def order_params
      params.require(:order).permit(:user_id, item_ids: [])
    end

end
