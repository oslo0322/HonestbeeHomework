class OrdersController < ApplicationController
    protect_from_forgery prepend: true
    before_action :authenticate_user! # 這個是 devise 提供的方法，先檢查必須登入

    def index
        @orders = Order.where({:user_id => current_user.id,
                               :status => 'shopping_cart'})
    end

    def pay
        @orders = Order.where({:user_id => current_user.id,
                               :status => 'shopping_cart'})
    end

    def purchased
        @purchased = Purchase.new({:user_id => current_user.id,
                                   :name => params[:purchased][:name],
                                   :phone => params[:purchased][:phone],
                                   :address => params[:purchased][:address],
                                   :payment_type => params[:purchased][:payment_type]})
        @purchased.save
        @orders = Order.where({:user_id => current_user.id,
                               :status => 'shopping_cart'})
                       .update_all({:purchase_id => @purchased.id, 
                                    :status => 'paid'})
        redirect_to "/orders"
    end

    def update
      @order = Order.find(params[:id])
      @order.update({:status => params[:status]})
      redirect_to "/admin/" + @order.purchase_id.to_s
    end

    private
    def purchase_params
        params.require(:purchased).permit(:name, :phone, :address, :payment_type)
    end
end
