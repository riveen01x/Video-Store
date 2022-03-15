class CartListController < ApplicationController
  def show
    @cart_items = current_customer.cart_items
    @total_amt = current_customer.cart_items.collect { |cart_item| cart_item.unit_price*cart_item.quantity }.sum

   end

end
