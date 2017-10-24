class OrdersController < ApplicationController
	protect_from_forgery prepend: true
	before_action :authenticate_user! # 這個是 devise 提供的方法，先檢查必須登入

    def index
        @orders = Order.where({:user_id => current_user.id,
                               :status => 'shopping_cart'})
    end
end
