class AdminController < ApplicationController
  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入
  before_action :authenticate_admin # 再檢查是否有權限

  def index
    if params[:status] and params[:status] != "all"
      ordered = Order.select("purchase_id").where({status: params[:status]})
      @purchases = Purchase.where(:id => ordered)
    else
      @purchases = Purchase.all
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    @orders = Order.where({:purchase_id => @purchase.id})
    @order_status = ["paid", "shipped", "cancelled"]
  end

  def update
    puts params
    # @purchase = Purchase.find(params[:id])
    redirect_to :back
  end
end
