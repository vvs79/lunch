class Api::OrdersController < Api::BaseController
	before_action :authenticate_user!

  def index
    @date = DateTime.now
    @orders = current_user.admin? ? Order.all.order(id: :desc) : current_user.orders.all.order(id: :desc)
    respond_with @orders
    # respond_with Order.all
  end

  def show
  	@order = Order.find(params[:id])
    respond_with @order
    # respond_with Order.find(params[:id])
  end

  # def create
  #   respond_with Order.create(order_params)
  # end

  # def destroy
  #   respond_with Order.destroy(params[:id])#, location: root_path
  # end

  def destroy
    @order = Order.find(params[:id])
    UsersMailer.order_destroyed(@order).deliver_now
    respond_with @order.destroy, location: api_orders_path
  end

  # def orders_for_today
  #   @orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
  #   respond_with @orders
  # end

  # private

  #   def order_params
  #     params.require(:order).permit(:user_id, item_ids: [])
  #   end
   
end
