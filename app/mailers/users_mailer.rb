class UsersMailer < ApplicationMailer
	def order_destroyed(order)
    @order = order
    mail to: 'vidoc1979@gmail.com', subject: "User: #{@order.user.email} destroyed order: #{@order.id}"
  end

  def order_created(order)
    @order = order
    mail to: 'vidoc1979@gmail.com', subject: "User: #{@order.user.email} created order: #{@order.id}"
  end
end
