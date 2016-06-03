module ApplicationHelper
  def full_title(page_title = nil)
    [page_title, "My Test"].compact.join(" | ")
  end

  def panel_title(count, title)
    content_tag(:h2, count) + content_tag(:h4, title)
  end

  # def set_id(index)
  #   params[:page].blank? ? index + 1 : ((params[:page]).to_i - 1) * 10 + index + 1
  # end

  def menu_for_today
    Item.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def day_menu(day)
    Item.where("DATE(created_at) = ?", Date.today - day)
  end

  def day_order(day)
    Order.where("DATE(created_at) = ?", Date.today - day)
  end

  # def user_order_for_today?
  #   current_user.orders.where("DATE(created_at) = ?", Date.today).count > 0 ? false : true
  # end
end
